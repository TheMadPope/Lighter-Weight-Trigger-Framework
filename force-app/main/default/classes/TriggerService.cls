/**
 * Example implementation of a Service class to determine if a Trigger should bepypassed.
 * @created 2022-11-04: Richard Moore
 */
public class TriggerService {
    
    /**
     * Basic method to check whether bypass is requested for the specified trigger handler.
     * Calls inner method for common functionality using dependency injection
     * @param triggerHandlerName (String): Name of the trigger handler class
     * @return boolean: TRUE if disabled
 	 * @created 2022-11-04: Richard Moore
     */
    public static Boolean isBypassEnabled(String triggerHandlerMethodName){
        List<TriggerBypass__mdt> bypassRecords = [SELECT Id, Bypass__c
                                                 FROM TriggerBypass__mdt
                                                 WHERE TriggerHandlerMethodName__c =:triggerHandlerMethodName
                                                 LIMIT 1];
        return isBypassEnabledOrDefault(bypassRecords);
    }
    
    /**
     * Dependency Injection method to allow functional testing without using production metadata
     * @param bypassRecords (List<TriggerBypass__mdt>): List of records with expected size of 0 or 1
     * @return boolean: TRUE if disabled
     * @created 2022-11-04: Richard Moore
     */
    @testVisible
    private static Boolean isBypassEnabledOrDefault(List<TriggerBypass__mdt> bypassRecords){
        return bypassRecords.isEmpty() ? false : bypassRecords[0].Bypass__c;
    }
}