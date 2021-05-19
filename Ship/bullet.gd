extends Area2D

export var bullet_vel = 500
var dir = Vector2(0,0)
export (PackedScene) var explosion

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	self.position+= dir*bullet_vel*delta
	
	if len(get_overlapping_bodies()) >0 :
		queue_free()
		var expl = explosion.instance()
		expl.position = position
		get_node("/root").add_child(expl)
	elif len(get_overlapping_areas()) > 0:
		queue_free()
		var expl = explosion.instance()
		expl.position = position
		get_node("/root").add_child(expl)

	pass


func start(position, velocity):
	self.position = position
	dir = (get_global_mouse_position() - self.position).normalized()
	self.look_at(get_global_mouse_position())
	
