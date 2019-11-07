public class AccountTriggerHandler extends TriggerHandler{
    public AccountTriggerHandler(){
        IsDisabled = false;
    }
    
    public AccountTriggerHandler(boolean disable){
        IsDisabled = disable;
    }
    
    public void BeforeInsert(List<SObject> newItems){
        system.debug('Overridden Before Insert action.');
    }
}
