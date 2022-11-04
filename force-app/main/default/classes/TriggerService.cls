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
    public static boolean isBypassEnabled(String triggerHandlerName){
        TriggerBypass__mdt bypassRecord = [SELECT Id, Bypass__c
                                           FROM TriggerBypass__mdt
                                           WHERE TriggerHandlerName__c =:triggerHandlername
                                           LIMIT 1];
        return isBypassEnabled(bypassRecord);
    }
    
    /**
     * Dependency Injection method to allow functional testing without using production metadata
     * @param triggerHandlerName (String): Name of the trigger handler class
     * @return boolean: TRUE if disabled
     * @created 2022-11-04: Richard Moore
     */
    public static boolean isBypassEnabled(TriggerBypass__mdt bypassRecord){
        return bypassRecord?.Bypass__c;
    }
}