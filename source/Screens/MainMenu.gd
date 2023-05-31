extends Control

@export_file("*.tscn") var start_scene_path = "res://Levels/Level1.tscn"
@export_file("*.tscn") var controls_scene_path = "res://Interface/InputRemap/InputRemap.tscn"

var directory_size : int = 0
var user_folder_path : String = "user://"
var user_settings_path : String = "user://user_settings.config"
var save_file_path : String = ""

func _ready():
	var dir_access : DirAccess = DirAccess.open(user_folder_path)
	directory_size = dir_access.get_directories().size()
	save_file_path = "user://save_%s/save.sav" % (directory_size - 2) #Gambiarra!
	
	$StartButton.grab_focus()
	
	if directory_size >= 2:
		$ContinueButton.disabled = false


func load_input_settings() -> void:
	
	if not FileAccess.file_exists(user_settings_path):
		return
	
	var file_access : FileAccess = FileAccess.open(user_settings_path, FileAccess.READ)
	#print(file_access.get_buffer(file_access.get_length()))
	var remap_dictionary : Dictionary = JSON.parse_string(file_access.get_as_text())
	
	for action in remap_dictionary.keys():
		InputMap.action_erase_events(action)
		var event : InputEventKey = InputEventKey.new()
		event.physical_keycode = remap_dictionary[action]
		InputMap.action_add_event(action, event)


func _on_start_button_pressed():
	get_tree().change_scene_to_file(start_scene_path)


func _on_continue_button_pressed():
	get_tree().change_scene_to_file(FileAccess.get_file_as_string(save_file_path))


func _on_quit_button_pressed():
	get_tree().quit()


func _on_controls_button_pressed():
	get_tree().change_scene_to_file(controls_scene_path)
