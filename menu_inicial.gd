extends CanvasLayer


func _on_comecar_joguinho_pressed():
	#get_tree().change_scene_to_file("res://nivel/nivel.tscn")
	get_tree().change_scene_to_file("res://nivel/nivel.tscn")
	#visible = false
func _on_sair_joguinho_pressed():
	get_tree().quit()
