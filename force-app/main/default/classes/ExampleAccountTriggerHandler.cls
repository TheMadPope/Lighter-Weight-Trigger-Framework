/**
 * Example of an TriggerHandler extending the virtual TriggerHandler class. Should be invoked within a Trigger - just instantiate and run (for all contexts)
 */
public class ExampleAccountTriggerHandler extends TriggerHandler {

    /**
     * Action(s) to take on the Before Insert operation.
     * Should invoke a Service class to do actual work, keep any logic out of the Handler
     * @param newRecords (List<SObject>): Records that will be inserted, from the Context.
     */
    public override void beforeInsert(List<SObject> newRecords) {
        system.debug('Overridden Before Insert action.');
        //Call an AccountService method to do things.
    }
}