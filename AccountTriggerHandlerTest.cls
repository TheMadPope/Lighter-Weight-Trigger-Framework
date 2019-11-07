@isTest
public class AccountTriggerHandlerTest {
	
    @isTest
    static void AccountInsert(){
        system.debug('Insert test');
        Account a = new Account();
        a.Name = 'TestAccount1';
        test.startTest();
        database.insert(a);
        test.stopTest();
    }
    
    @isTest
    static void AccountUpdate(){
        system.debug('Update test');
        Account a = new Account();
        a.Name = 'TestAccount1';
        database.insert(a);
        a.Website = 'www.richardemoore.com';
        test.startTest();
        database.update(a);
        test.stopTest();
    }
    
    @isTest
    static void AccountDelete(){
        system.debug('Delete test');
        Account a = new Account();
        a.Name = 'TestAccount1';
        database.insert(a);
        test.startTest();
        database.delete(a);
        test.stopTest();
    }
    
    @isTest
    static void AccountUndelete(){
        system.debug('Undelete test');
        Account a = new Account();
        a.Name = 'TestAccount1';
        database.insert(a);
        database.delete(a);
        test.startTest();
        database.undelete(a);
        test.stopTest();
    }
    
    @isTest
    static void disable(){
        system.debug('disable test');
        AccountTriggerHandler h = new AccountTriggerHandler(true);
        test.startTest();
        system.assertEquals(true, h.IsDisabled);
        test.stopTest();
    }
    
    @isTest
    static void disableDefault(){
        system.debug('Default disable test');
        AccountTriggerHandler h = new AccountTriggerHandler();
        test.startTest();
        system.assertEquals(false, h.IsDisabled);
        test.stopTest();
    }
}
