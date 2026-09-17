extends CharacterBody2D

const SPEED = 350
const JUMP_SPEED = -800
var contadorSaltos = 0


func _physics_process(delta: float) -> void:
 	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
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
#rockfall
	if(!is_on_floor()) and Input.is_action_pressed("shift"):
			velocity.x = 0
			velocity += get_gravity() * 3.5 * delta

		
		
		
# triple salto
	
	if Input.is_action_just_pressed("espacio") and !is_on_floor() and contadorSaltos > 0:
		
		velocity.y = JUMP_SPEED
		contadorSaltos+=1
		if(contadorSaltos == 3):
			contadorSaltos = 0
			pass
		
 #teleport con z (que avance numero de pixeles hacia una direccion)
	if Input.is_action_pressed("z"):
		position.x += 10

# baja gravedad pulsando control
	if not is_on_floor() and Input.is_action_pressed("control"):
		velocity += get_gravity() * delta
			

# wall climb (existe is_on_wall())
	if(is_on_wall()):
		velocity.y = JUMP_SPEED
# sprint con shift pulsado
	if(Input.is_action_pressed("shift") and Input.is_action_pressed("derecha") and is_on_floor()):
		velocity.x = SPEED + 250
	if(Input.is_action_pressed("shift") and Input.is_action_pressed("izquierda") and is_on_floor()):
		velocity.x = -SPEED - 250
		

	move_and_slide()
