extends Control

@onready var remapping_control : Control = $RemappingControl

var user_folder_path : String = "user://user_settings.config"

func _on_back_button_pressed():
	save_input_settings()
	get_tree().change_scene_to_file("res://Screens/MainMenu.tscn")


func save_input_settings():
	var file_access : FileAccess = FileAccess.open(user_folder_path, FileAccess.WRITE)
	var remap_button_dictionary : Dictionary = {}
	
	for child in remapping_control.get_children():
		var remap_button = child.get_child(0)
		var action : String = remap_button.binding_action
		var event : InputEventKey = InputMap.action_get_events(action)[0]
		
		remap_button_dictionary[action] = event.physical_keycode
		
	file_access.store_string(JSON.stringify(remap_button_dictionary))
