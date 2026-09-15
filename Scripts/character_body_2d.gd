extends CharacterBody2D

const SPEED = 200
const JUMP_SPEED = -600
var contadorSaltos = 0


func _physics_process(delta: float) -> void:
	
	
	# baja gravedad pulsando control
	if not is_on_floor() and Input.is_action_pressed("control"):
		velocity.y += 10  * delta
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	 #teleport con z (que avance numero de pixeles hacia una direccion)
	if Input.is_action_pressed("z"):
		position.x += 10

	
		
# movimiento en el eje x
	if Input.is_action_pressed("izquierda"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("derecha"):
		velocity.x = SPEED
	else:
		velocity.x = 0

# salto del personaje
	if Input.is_action_just_pressed("espacio") and is_on_floor():
		contadorSaltos+=1
		velocity.y = JUMP_SPEED
		
		
		
# triple salto
	
	if Input.is_action_just_pressed("espacio") and !is_on_floor() and contadorSaltos > 0:
		
		velocity.y = JUMP_SPEED
		contadorSaltos+=1
		if(contadorSaltos == 3):
			contadorSaltos = 0
			pass
		

#rockfall
	if(position.y < 0) and Input.is_action_pressed("shift"):
		
			velocity.x = 0
			velocity.y += 9.8 * delta
# wall climb (existe is_on_wall())
	if(is_on_wall()):
		velocity.y = JUMP_SPEED
# sprint con shift pulsado
	if(Input.is_action_pressed("shift") and Input.is_action_pressed("derecha") and is_on_floor()):
		velocity.x = SPEED + 150
	if(Input.is_action_pressed("shift") and Input.is_action_pressed("izquierda") and is_on_floor()):
		velocity.x = -SPEED - 150
		

	move_and_slide()
