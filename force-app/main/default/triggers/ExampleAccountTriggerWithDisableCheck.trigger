trigger ExampleAccountTriggerWithDisableCheck on Account (
    after delete,
    after insert,
    after update,
    after undelete,
    before delete,
    before insert,
    before update
) {
    /**
     * In reality, I would probably have all of the trigger_events set on one line,
     * but for this example I've set them on their own lines and listed alphabetically.
     * Note that I've registered this on every trigger_event - so that I don't ever have to touch this trigger again.
     * Any future updates will be made in the trigger handler class.
     * 
     * For naming convention, since this will be the only trigger on Account in this package / namespace / org,
     * I would simply call this AccountTrigger.
     * 
     * Best practice would be to have only one trigger per sObject per package (or one per org, if not making a package).
     **/
    ExampleAccountTriggerHandler handler = new ExampleAccountTriggerHandler(TriggerService.isBypassEnabled('ExampleAccountTriggerHandler'));
    handler.run();
    System.debug('I am disabled, invoking run() returned early and I took no action!!!');
}