extends Control


func _on_back_button_pressed():
	save_input_settings()
	get_tree().change_scene_to_file("res://Screens/MainMenu.tscn")


func save_input_settings():
	pass
