extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_pressed("izquierda")):
		print("Se ha pulsado izquierda")
	if (Input.is_action_just_released("izquierda")):
		print("Se ha dejado de pulsar izquierda")
	if(Input.is_action_pressed("derecha")):
		print("Se ha pulsado derecha")
	
	pass
	
func _physics_process(delta: float) -> void:
	pass
