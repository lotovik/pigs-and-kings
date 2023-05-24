extends Control

@export_file("*.tscn") var main_menu_scene_path = "res://Screens/MainMenu.tscn"

func _ready():
	print()


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
#	save_scene()
	get_tree().quit()

func save_scene():
	var user_folder_path : String = "user://"
	var dir_access : DirAccess = DirAccess.open(user_folder_path)
	var directory_size : int = dir_access.get_directories().size()
	
	if directory_size >= 2:
		directory_size -= 1
		dir_access.make_dir("save_%s" % directory_size)
	
	var save_file_path : String = "user://save_%s/save.sav" % directory_size
	
	var file_access : FileAccess = FileAccess.open(save_file_path, FileAccess.WRITE)
	var scene_path : String = owner.scene_file_path
	file_access.store_string(scene_path)
	file_access.close()
