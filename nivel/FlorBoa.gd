extends Area2D
var pontos := 5 #cada melancia vale 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.name == "player": #se o corpo chmado pessoa passar pelo item
		print("coletou")
		$AnimatedSprite2D.play("florColetada") #chama a animacao
		Globals.pontos += pontos #soma os pontos coleados
		await $CollisionShape2D.call_deferred("queue_free")
		print(Globals.pontos)
		await $AnimatedSprite2D.animation_finished #executa outra animacao quando terminar a primeira
		queue_free() # some do mapa 
	
