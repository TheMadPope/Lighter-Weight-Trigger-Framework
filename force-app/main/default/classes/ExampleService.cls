/**
 * An example of a Service class to show the implementation of the TriggerHandler
 * INHERITED SHARING is important here because the Service class will be reused
 */
public inherited sharing class ExampleService {

    /**
     * Shows the ability to pass a list of specific sObject records without a deliberate cast from a trigger context
     * @param records (List<Account>): Records on which to act
     */
    public static void takeAListOfAccounts(List<Account> records){
        //Do things with the records
    }

    /**
     * Shows how a map must be cast to a specific sObject map when passing it to the Service (which should take its own specific type)
     * @param accountsById (Map<Id, Account>): Records by their Id
     */
    public static void takeAMapOfAccounts(Map<Id, Account> accountsById){
        //Do things with the records
    }
}