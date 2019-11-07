public class ExampleAccountTriggerHandler extends TriggerHandler {
	public ExampleAccountTriggerHandler() {
		IsDisabled = false;
	}

	public ExampleAccountTriggerHandler(boolean disable) {
		IsDisabled = disable;
	}
	//^ above this line, required by default.

	//Below this line, override the actions you want to intercept.
	public void BeforeInsert(List<SObject> newItems) {
		system.debug('Overridden Before Insert action.');
	}
}