extends Control

@export_file("*.tscn") var start_scene_path = "res://Levels/Level1.tscn"
var save_file_path : String = "user://saves/save_01.sav"

func _ready():
	$StartButton.grab_focus()
	
	if FileAccess.file_exists(save_file_path):
		$ContinueButton.disabled = false

func _on_start_button_pressed():
	get_tree().change_scene_to_file(start_scene_path)

func _on_continue_button_pressed():
	get_tree().change_scene_to_file(save_file_path)

func _on_quit_button_pressed():
	get_tree().quit()
