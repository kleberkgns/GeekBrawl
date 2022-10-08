extends KinematicBody2D


# Declare member variables here. Examples:
var direction = Vector2()
var speed = 3
var fireball = preload("res://Instantiables/Fireball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# ------------ Movimento ------------
	if(Input.is_key_pressed(KEY_W)):
		direction.y = -speed
	elif(Input.is_key_pressed(KEY_S)):
		direction.y = speed
	else:
		direction.y = 0
	
	if(Input.is_key_pressed(KEY_D)):
		direction.x = speed
	elif(Input.is_key_pressed(KEY_A)):
		direction.x = -speed
	else:
		direction.x = 0
	move_and_collide(direction)
	
	# -------------- Animação ------------
	if(direction.x == 0 and direction.y == 0):
		get_child(0).animation = "Idle"
	else:
		get_child(0).animation = "Walk"
	
	# -------------------- FLIP ------------
	if self.position.x < get_global_mouse_position().x:
		get_child(0).flip_h = false
	else:
		get_child(0).flip_h = true
	
	# ---------------------- Fireball -------------
	if Input.is_action_just_pressed("shoot"):
		#print("fogo")
		var new_fireball = fireball.instance()
		new_fireball.position = self.position
		self.get_parent().add_child(new_fireball)
