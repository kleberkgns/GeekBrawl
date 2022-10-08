extends KinematicBody2D


# Declare member variables here. Examples:
var player
var angle

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_child(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	angle = get_angle_to(player.position)
	move_and_collide(Vector2(1, 0).rotated(angle))