extends Timer


# Declare member variables here. Examples:
var enemy = preload("res://Instantiables/Enemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EnemySpawn_timeout():
	#print("Hora do inimigo")
	var new_enemy = enemy.instance()
	new_enemy.global_position = Vector2(rand_range(0, 1024), rand_range(0, 600))
	get_parent().add_child(new_enemy)
