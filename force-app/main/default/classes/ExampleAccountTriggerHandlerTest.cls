@ isTest
public class ExampleAccountTriggerHandlerTest {

    @isTest
    static void AccountInsert() {
        system.debug('Insert test');
        Account a = new Account();
        a.Name = 'TestAccount1';
        
        test.startTest();
        database.insert(a);
        test.stopTest();
        
        Account result = [SELECT Id, Name FROM Account LIMIT 1];
        
        System.assertEquals(a.Name, result.Name, 'The Account Name should remain, and it should have been validly inserted.');
    }

    @isTest
    static void AccountUpdate() {
        system.debug('Update test');
        Account a = new Account();
        a.Name = 'TestAccount1';
        database.insert(a);
        a.Website = 'www.richardemoore.com';
        
        test.startTest();
        database.update(a);
        test.stopTest();
        
        Account result = [SELECT Id, Name FROM Account LIMIT 1];
        
        System.assertEquals(a.Name, result.Name, 'The Account Name should remain, and it should have been validly inserted.');
    }

    @isTest
    static void AccountDelete() {
        system.debug('Delete test');
        Account a = new Account();
        a.Name = 'TestAccount1';
        database.insert(a);
        
        test.startTest();
        database.delete(a);
        test.stopTest();
        
        List<Account> results = [SELECT Id, Name FROM Account];
        
        System.assertEquals(0, results.size(), 'All accounts should have been deleted.');
    }

    @isTest
    static void AccountUndelete() {
        system.debug('Undelete test');
        Account a = new Account();
        a.Name = 'TestAccount1';
        database.insert(a);
        database.delete(a);
        
        test.startTest();
        database.undelete(a);
        test.stopTest();
        
        Account result = [SELECT Id, Name FROM Account LIMIT 1];
        
        System.assertEquals(a.Name, result.Name, 'The Account Name should remain, and it should have been validly undeleted.');
    }

    @isTest
    static void itShouldInitializeAsDisabled() {
        test.startTest();
        ExampleAccountTriggerHandler h = new ExampleAccountTriggerHandler(true);
        test.stopTest();

        system.assertEquals(true, h.IsDisabled, 'The handler should have been initialized as Disabled.');
    }

    @isTest
    static void disableDefault() {
        ExampleAccountTriggerHandler h = new ExampleAccountTriggerHandler();
        
        test.startTest();
        system.assertEquals(false, h.IsDisabled);
        test.stopTest();
        
        system.assertEquals(false, h.IsDisabled, 'The handler should have been initialized as NOT Disabled.');
    }
}