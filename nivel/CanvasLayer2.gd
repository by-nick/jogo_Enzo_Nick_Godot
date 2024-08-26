extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _on_sair_pressed():
	get_tree().paused = false
	visible = false
#para sair do jogo

func _on_voltar_pressed():
	get_tree().Voltar()
	#para voltar ao jogo


func _on_reiniciar_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://nivel/nivel.tscn")
#para reiniciar a fase
func _unhandled_input(event):
	if event.is_action("Pause"):
		get_tree().paused = true
		visible = true
		#para o botao P
