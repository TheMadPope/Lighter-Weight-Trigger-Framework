/**
 * Example of an TriggerHandler extending the virtual TriggerHandler class. Should be invoked within a Trigger - just instantiate and run (for all contexts)
 */
public class ExampleAccountTriggerHandler extends TriggerHandler {

    /**
     * Default Constructor, sets IsDisabled to False
     */
    public ExampleAccountTriggerHandler() {
        IsDisabled = false;
    }

    /**
     * Constructor to allow deliberate overriding of the IsDisabled boolean, which can be set by, perhaps, a Custom Metadata record.
     * This allows the TriggerHandler action to be bypassed (during bulk loads, for example) 
     * @param disable (boolean): If true, the Triggerhandler will not execute any actions
     */
    public ExampleAccountTriggerHandler(boolean disable) {
        IsDisabled = disable;
    }

    //^ above this line, required by default.
    //Below this line, override the operations you want to intercept.

    /**
     * Action(s) to take on the Before Insert operation.
     * Should invoke a Service class to do actual work, keep any logic out of the Handler
     * @param newRecords (List<SObject>): Records that will be inserted, from the Context.
     */
    public override void beforeInsert(List<SObject> newRecords) {
        system.debug('Overridden Before Insert action.');
    }
}
