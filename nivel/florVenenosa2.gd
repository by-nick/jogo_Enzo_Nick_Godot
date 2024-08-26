extends Area2D
@onready var player = $"../../player" #conectando o codigo ao player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body): 
	if body.name == "player": #se o corpo chamado pessoa passar por mim
		print("morreu")
		player._dano()#chama funcao
	
