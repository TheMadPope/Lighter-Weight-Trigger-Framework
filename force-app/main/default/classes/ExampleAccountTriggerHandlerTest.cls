@IsTest
private class ExampleAccountTriggerHandlerTest {

    @IsTest
    private static void itShouldInsertAccount(){
        Account record = new Account();
        record.Name = 'Example';
        record.Website = 'http://www.richardemoore.com';
        
        Test.startTest();
        Database.insert(record);
        Test.stopTest();
        
        Account expected = [SELECT Id, Website FROM Account WHERE Id=:record.Id];
        
        Assert.areEqual(record.Website, expected.Website, 'The Account should have been successfully inserted');
    }

    @IsTest
    private static void itShouldUpdateAccount(){
        Account record = new Account();
        record.Name = 'Example';
        record.Website = 'http://www.richardemoore.com';
        Database.insert(record);
        
        record.Website = 'https://www.homestarrunner.com';
        
        Test.startTest();
        Database.update(record);
        Test.stopTest();
        
        Account expected = [SELECT Id, Website FROM Account WHERE Id=:record.Id];
        
        Assert.areEqual(record.Website, expected.Website, 'The Account should have been successfully updated');
    }
}