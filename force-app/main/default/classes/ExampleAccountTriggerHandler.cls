/**
 * Example of an TriggerHandler extending the virtual TriggerHandler class. Should be invoked within a Trigger - just instantiate and run (for all contexts)
 */
public class ExampleAccountTriggerHandler extends TriggerHandler {

    /**
     * Action(s) to take on the Before Insert operation.
     * NOTE! If you're not actually doing anything on this stage, DO NOT implement this method, just delete it!
     * Should invoke a Service class to do actual work, keep any logic out of the Handler
     * @param newRecords (List<SObject>): Records that will be inserted, from the Context.
     */
    public override void beforeInsert(List<SObject> newRecords) {
        ExampleService.takeAListOfAccounts(newRecords);
    }

    /**
     * Action to take on After Insert action. Override in implementing class if action is desired
     * Implementing class can use explicit sObject type name in place of SObject
     * @param newRecords (Map<Id, SObject>): Map of records after insert, by their Ids
     */
    public override void afterInsert(Map<Id, SObject> newRecords) {
        //No need to cast when passing a list
        ExampleService.takeAListOfAccounts(newRecords.values());

        //Note the cast to Map<Id, Account> - When passing the map you have to cast to the specified type
        ExampleService.takeAMapOfAccounts((Map<Id, Account>)newRecords);
    }
}