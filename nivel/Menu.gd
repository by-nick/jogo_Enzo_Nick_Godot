extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	#visible = true
	pass


func _on_iniciar_pressed():
	get_tree().change_scene_to_file("res://nivel/nivel.tscn")
	#get_tree().quit()
	visible = false


func _on_sair_pressed():
	get_tree().quit()
