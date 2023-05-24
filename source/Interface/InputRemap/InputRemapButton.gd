extends Button

@export var binding_action = "attack"


func _ready():
	for event in InputMap.action_get_events(binding_action):
		if event is InputEventKey:
			text = event.as_text_physical_keycode()
			break


func _gui_input(event):
	if event is InputEventKey or event is InputEventJoypadButton or event is InputEventJoypadMotion:
		InputMap.action_erase_events(binding_action)
		InputMap.action_add_event(binding_action, event)
		text = event.as_text_physical_keycode()
		release_focus()
		button_pressed = false
