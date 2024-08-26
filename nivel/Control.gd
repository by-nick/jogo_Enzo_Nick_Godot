extends Control
@onready var coin_counter = $MarginContainer/coin_counter/coinCounter
@onready var life_counter = $MarginContainer/life_counter2/lifeCounter
@onready var timer_count = $MarginContainer/timer_counter/timer_count

var min=0
var seg=0

@export_range (0,2) var min_padrao = 1
@export_range (0,59) var seg_padrao = 0

@onready var tempo = $Timer as Timer
signal tempo_acabou() #recarrega o mundo

# Called when the node enters the scene tree for the first time.
func _ready():
	coin_counter.text = str("%04d"%Globals.pontos)
	life_counter.text = str("%02d"%Globals.vidaPlayer)
	timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	
	min = min_padrao
	seg = seg_padrao
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	coin_counter.text = str("%04d"%Globals.pontos)
	life_counter.text = str("%02d"%Globals.vidaPlayer)
#mostra na tela normalmente
	if min == 0 && seg == 0:
		emit_signal("tempo_acabou")
	if Globals.relogio !=0:
		seg += Globals.relogio
		print(seg)
		Globals.relogio -= Globals.relogio
		print(Globals.relogio)

func _on_timer_timeout():
	if seg == 0:
			if min >0:
				min -=1
				seg = 60
	seg -=1
	if seg ==0 and min ==0:
		emit_signal("tempo_acabou")
		
	timer_count.text = str("%02d" % min) + ":" + str("%02d" % seg)
	

