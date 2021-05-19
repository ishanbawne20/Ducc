extends Node2D

export (PackedScene) var Missile
onready var Missile_container = get_node("Missile_container")
var rockets_disp = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Missile_timer_timeout():
	var missile = Missile.instance()
	Missile_container.add_child(missile)
	missile.start(get_node("Ship"))
	missile.position = Vector2(randi()%2*get_viewport().size.x,randi()%2*get_viewport().size.y) 
	rockets_disp += 1
	get_node("Missile_timer").wait_time = rand_range(0.2, 2.9)
