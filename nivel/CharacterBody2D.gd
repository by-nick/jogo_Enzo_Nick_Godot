extends CharacterBody2D

#velocidade constante
const SPEED = 200.0
#velocidade de pulo constante
const JUMP_VELOCITY = -400.0
var isjump = false
#chama referencia
@onready var animation = $animacao
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
signal morreu
#adiciona a gravidade
func _physics_process(delta):
	# Add the gravity.
	# se não estiver tocando no chão:
	if not is_on_floor():
		#velocidade do eixo Y com a gravidade
		velocity.y += gravity * delta

	# Handle jump.
	#se a ação de estar no chão estiver funcionando 
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		isjump = true
	elif is_on_floor():
		isjump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#variação de direções direita e esquerda
	var direction = Input.get_axis("ui_left", "ui_right")
	#se a direção for diferente de 0 faz ele andar 
	if direction !=0:
		velocity.x = direction * SPEED
				#flipa. Se for + fica normal, se for - vira ao contrario
		$animacao.scale.x = direction 
	else:
			velocity.x = move_toward(velocity.x, 0, SPEED * 0.1)	
			$animacao.play("jump")
	#animação
	if is_on_floor() && !isjump:
		if direction !=0:
			$animacao.play("run")
		elif isjump:
			$animacao.play("jump")
		else:
			#velocity.x = move_toward(velocity.x, 0, SPEED)
			$animacao.play("idle")
		
	move_and_slide()
	
func vidaPersonagem(knock_force := Vector2.ZERO, duration:=0.25):
	if Globals.vidaPlayer > 0:
		Globals.vidaPlayer -= 1
	else:
		queue_free()
		emit_signal("morreu")
		

		
	
func _dano(): #funcao/procedimento para dano 
	print("dano")
	emit_signal("morreu") #emite sinal para quando quisermos chamar em outro script

