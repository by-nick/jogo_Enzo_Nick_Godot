extends Node2D
@onready var player = $player
@onready var control = $HUD/Control


# Called when the node enters the scene tree for the first time.
func _ready():
	player.morreu.connect(resetGame)
	Globals.pontos =0
	control.tempo_acabou.connect(resetGame)
	#quando zera o tempo reinicia
func resetGame():
	get_tree().reload_current_scene()
	
func _process(delta):
	pass
