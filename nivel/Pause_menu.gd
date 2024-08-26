extends CanvasLayer

func _ready():
	visible = false

func _process(delta):
	pass

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		visible=true
		get_tree().paused = true
		
func _on_sair_pressed():
	get_tree().quit()

func _on_voltar_pressed():
	get_tree().paused = false
	visible = false
