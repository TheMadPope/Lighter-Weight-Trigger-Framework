# Lighter-Weight-Trigger-Framework
A lighter-weight implementation of [Chris Aldridge's Lightweight Apex Trigger Framework](https://github.com/ChrisAldridge/Lightweight-Trigger-Framework), using a base virtual class instead of an interface.

# To Implement:
1. Create the TriggerHandler virtual class in your org
2. Create your object-specific trigger handler, extending the virtual class (refer to the included *ExampleAccountTriggerHandler* class for an example)
3. Override any of the methods (such as beforeUpdate, afterInsert, etc) where you want to take action. The TriggerHandler should not perform any action itself, but should pass off the records to Service classes for action.
4. Create (or modify) your trigger to handle **all** events
5. In the trigger, instantiate your object-specific TriggerHandler implementation, and invoke the .run() method.
6. Never update the trigger itself again! All future updates will be simply added to the triggerHandler implementation.
