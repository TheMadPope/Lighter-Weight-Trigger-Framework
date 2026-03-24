@IsTest
private class TriggerServiceTest {
    
    @IsTest
    private static void itShouldQueryMetadata(){
        String TRIGGER_HANDLER_METHOD_NAME = 'itShouldQueryMetadata';
        
        Test.startTest();
        Boolean actual = TriggerService.isBypassEnabled(TRIGGER_HANDLER_METHOD_NAME);
        Test.stopTest();
        
        List<TriggerBypass__mdt> bypassRecords = [SELECT Id, Bypass__c
                                                  FROM TriggerBypass__mdt
                                                  WHERE TriggerHandlerMethodName__c =:TRIGGER_HANDLER_METHOD_NAME
                                                  LIMIT 1];
        
        Boolean expected = false;
        if (!bypassRecords.isEmpty()){
            expected = bypassRecords[0].Bypass__c;
        }
        
        Assert.areEqual(expected, actual, 'The value should be returned accurately, defaulting to false');
    }
    
    @IsTest
    private static void itShouldDefaultToFalseWhenNoMetadataRecord(){        
        Test.startTest();
        Boolean actual = TriggerService.isBypassEnabledOrDefault(new List<TriggerBypass__mdt>());
        Test.stopTest();
        
        Assert.isFalse(actual, 'The value should default to false when no metadata record');
    }
    /*
    @IsTest
    private static void itShouldDefaultToFalseWhenNoMetadataRecord2(){
        
        TriggerBypass__mdt exampleRecord = new TriggerBypass__mdt();
        exampleRecord.TriggerHandlerMethodName__c='itShouldDefaultToFalseWhenNoMetadataRecord';
        exampleRecord.Bypass__c = true;
        
        Test.startTest();
        Boolean actual = TriggerService.isBypassEnabledOrDefault(null);
        Test.stopTest();
        
        Assert.areEqual(expected, actual, 'The value should be returned accurately, defaulting to false');
    }*/

}