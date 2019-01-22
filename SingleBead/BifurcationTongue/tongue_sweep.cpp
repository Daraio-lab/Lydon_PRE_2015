
#include <ZIHF2LI.h>
#include <sweeper.h>
#include <ZI_scope.h>
#include <iostream>
#include <time.h>

using namespace std;


struct SetSubharmonic : ActionObject
{
	Sweeper<double, double> * sweeper;
	ZIHF2LI * lockIn1;
	void executeAction()
	{
		lockIn1->turn_output_on(0,0);
		Sleep(3000);
		double current_freq = sweeper->currentSlowValue;
		double current_drive = .03;
		lockIn1->set_reference_amplitude(0,current_drive);
		lockIn1->set_frequency(1,current_freq/2);
		lockIn1->turn_output_on(0,1);
		Sleep(1000);
	}
};

int main(void)
{
    ZIHF2LI lockIn(false);
	lockIn.turn_output_on(0,1);

	ZI_scope myscope = ZI_scope(&lockIn);

    Sweeper<double, double> mySweeper;
    
	SetSubharmonic subaction;
	subaction.lockIn1 = &lockIn;
	subaction.sweeper = &mySweeper;
	mySweeper.actionBeforeSlowStep = &subaction;

    mySweeper.setSlowVariable(lockIn.setFrequencyLink);
    //mySweeper.addSlowIterationLinearRange(7000, 8500, 10);
    mySweeper.addSlowIterationLinearRange(6300, 8000, 50);

    mySweeper.setFastVariable(lockIn.setReferenceAmplitudeLink);
    mySweeper.addFastIterationLinearRange(.020, .13, 0.003);
	//mySweeper.addFastIterationLinearRange(.020, .02010, 0.001);


	mySweeper.actionBeforeMeasurement = myscope.triggerAction;
	mySweeper.addMeasuredVariable(myscope.getMaxScopeLink);
	mySweeper.addMeasuredVariable(myscope.getPkToPkLink);
	mySweeper.addMeasuredVariable(myscope.getLocalPowerLink);
	mySweeper.addMeasuredVariable(myscope.getLocalNormalizedPowerLink);
	mySweeper.addMeasuredVariable(myscope.getTotalPowerLink);

	mySweeper.addMeasuredVariable(lockIn.getMeasuredAmplitudeLink1);
    mySweeper.addMeasuredVariable(lockIn.getMeasuredPhaseLink1);
	mySweeper.addMeasuredVariable(lockIn.getMeasuredAmplitudeLink4);
	mySweeper.addMeasuredVariable(lockIn.getMeasuredPhaseLink4);

    mySweeper.waitTimeBetweenFastSteps = 0.25;

    mySweeper.runSweep();
    

    mySweeper.saveEverythingAsText("SingleBeadBif");

	lockIn.set_frequency(1);
	lockIn.turn_output_on(0,0);
	return 0;
}
