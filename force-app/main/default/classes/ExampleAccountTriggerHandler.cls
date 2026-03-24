/**
 * Example of an TriggerHandler extending the virtual TriggerHandler class. Should be invoked within a Trigger - just instantiate and run (for all contexts)
 */
public class ExampleAccountTriggerHandler extends TriggerHandler {

    /**
     * Action(s) to take on the Before Insert operation.
     * NOTE! If you're not actually doing anything on this (or any) stage, DO NOT implement this method, just delete it!
     * Only override those methods where you want to actually take action
     * Should invoke a Service class to do actual work, keep any logic out of the Handler
     * @param newRecords (List<SObject>): Records that will be inserted, from the Context.
     */
    public override void beforeInsert(List<sObject> newRecords) {
        //Note that the override signature is sObject, but the target method here takes List<Account>, as implicit conversion is our friend
        ExampleService.takeAListOfAccounts(newRecords);
    }

    /**
     * Action(s) to take on After Insert action.
     * @param newRecords (Map<Id, SObject>): Map of records after insert, by their Ids
     */
    public override void afterInsert(Map<Id, SObject> newRecords) {
        //No need to cast when passing a list
        ExampleService.takeAListOfAccounts(newRecords.values());

        //Note the cast to Map<Id, Account> - When passing the map you have to cast to the specified type
        ExampleService.takeAMapOfAccounts((Map<Id, Account>)newRecords);
    }

    /**
     * Action(s) to take on Before Update action.
     * NOTE! This is an example of a trigger bypass in action.
     * @param newRecordsById (Map<Id, SObject>): Map of records after insert, by their Ids
     * @param oldRecordsById (Map<Id, SObject>): Map of records after insert, by their Ids
     */
    public override void beforeUpdate(Map<Id, SObject> newRecordsById, Map<Id, SObject> oldRecordsById){
        if (TriggerService.isBypassEnabled('ExampleAccountTriggerHandler.beforeUpdate')){ return; }
    }
}