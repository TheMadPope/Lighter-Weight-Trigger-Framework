/**
 * @description  This is the base class to be extended by all trigger handler classes.
 *               Simply implement the methods which are required for the trigger.
 *               Ignore any events that you do not need blank, like:
 *                public void BeforeInsert(SObject[] newItems){
 *                    system.debug('Overridden Before Insert action.');
 *                }
 * @author Chris Aldridge, http://chrisaldridge.com/triggers/lightweight-apex-trigger-framework/
 * @date Jan 4, 2016
 * @author Mark H. Morrison, https://github.com/MarkHMorrison/Lightweight-Trigger-Framework
 * @date Sat Dec 29, 2018
 * @author Richard E. Moore - changed from Interface to base(virtual) class, https://github.com/TheMadPope/Lighter-Weight-Trigger-Framework.git
 * @date Sat Nov 7, 2019
 */
public virtual class TriggerHandler {

    /**
    Default constructor, setting IsDisabled=false 
     */
	public TriggerHandler() {
		IsDisabled = false;
	}

    /**
    Constructor to allow deliberate overriding of the IsDisabled boolean, which can be set by, perhaps, a Custom Metadata record.
    This allows the TriggerHandler action to be bypassed for (for example) bulk loads
     */
	public TriggerHandler(boolean disable) {
		IsDisabled = disable;
	}

    /**
    If desired, override in the implementing class that extends this class
     */
	virtual void BeforeInsert(SObject [] newItems) {
		//Override in the implementation class
	}

    /**
    If desired, override in the implementing class that extends this class
     */
	virtual void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
		//Override in the implementation class
	}

    /**
    If desired, override in the implementing class that extends this class
     */
	virtual void BeforeDelete(Map<Id, SObject> oldItems) {
		//Override in the implementation class
	}

    /**
    If desired, override in the implementing class that extends this class
     */
	virtual void AfterInsert(Map<Id, SObject> newItems) {
		//Override in the implementation class
	}

    /**
    If desired, override in the implementing class that extends this class
     */
	virtual void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
		//Override in the implementation class
	}

    /**
    If desired, override in the implementing class that extends this class
     */
	virtual void AfterDelete(Map<Id, SObject> oldItems) {
		//Override in the implementation class
	}

    /**
    If desired, override in the implementing class that extends this class
     */
	virtual void AfterUndelete(Map<Id, SObject> oldItems) {
		//Override in the implementation class
	}

    /**
    Boolean to bypass triggerHandler action if desired
     */
	public Boolean IsDisabled { get; set; }

	/*
	 In the trigger itself, invoke a new triggerhandler extending this class, and invoke the Run() method.
     In that triggerHandler class, override any of the methods above that you want to invoke
	 This method will fire the appropriate methods on the handler depending on the trigger context.
	 */
	public virtual void Run() {
		// Check to see if the trigger has been disabled. If it has, return
		if(IsDisabled) {
			//Modify to check a custom metadata or something.
			return;
		}

		// Detect the current trigger context and fire the relevant methods on the trigger handler:
		switch on Trigger.operationType {
			when BEFORE_INSERT {
				BeforeInsert(trigger.new);
			} when BEFORE_UPDATE {
				BeforeUpdate(trigger.newMap, trigger.oldMap);
			} when BEFORE_DELETE {
				BeforeDelete(trigger.oldMap);
			} when AFTER_INSERT {
				AfterInsert(Trigger.newMap);
			} when AFTER_UPDATE {
				AfterUpdate(trigger.newMap, trigger.oldMap);
			} when AFTER_DELETE {
				AfterDelete(trigger.oldMap);
			} when AFTER_UNDELETE {
				AfterUndelete(trigger.newMap);
			}
		}
	}
}
