extends Control

@export_file("*.tscn") var main_menu_scene_path = "res://Screens/MainMenu.tscn"

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = not visible
		get_tree().paused = not get_tree().paused
		$SaveButton.grab_focus()

func _on_save_button_pressed():
	save_scene()

func _on_main_menu_button_pressed():
	save_scene()
	get_tree().change_scene_to_file(main_menu_scene_path)

func _on_quit_button_pressed():
	save_scene()
	get_tree().quit()

func save_scene():
	var directory_save_path : String = "user://"
	var dir_access : DirAccess = DirAccess.open(directory_save_path)
	dir_access.make_dir("user://saves")
	
	var save_file_path : String = "user://saves/save_01.sav"
	
	var file_access : FileAccess = FileAccess.open(save_file_path, FileAccess.WRITE)
	var scene_path : String = owner.scene_file_path
	file_access.store_string(scene_path)
	file_access.close()
