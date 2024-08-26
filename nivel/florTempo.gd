extends Area2D
@onready var control = $"../../CanvasLayer/Control"


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	
	if body.name == "player": #se o corpo chmado pessoa passar pelo item
		print("coletou")
		$AnimatedSprite2D.play("florTempoColetada") #chama a animacao
		await $CollisionShape2D.call_deferred("queue_free")
		await $AnimatedSprite2D.animation_finished #executa outra animacao quando terminar a primeira
		queue_free() # some do mapa 
	


