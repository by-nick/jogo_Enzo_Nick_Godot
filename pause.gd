extends CanvasLayer


func _ready():
	visible = false

func _on_pause_pressed():
	get_tree().paused = false
	visible = false

func _on_reiniciar_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://cenas/nivelzinho_1.tscn")

func _on_voltar_pressed():
	get_tree().voltar()

func _unhandled_input(event):
	if event.is_action("pause"):
		get_tree().paused = true
		visible = true
