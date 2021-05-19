extends Area2D

export (int) var missile_vel = 500
onready var Ship = get_node("/root/Main/Ship")
var dir = Vector2(0,0)
var threshold_range = 300
export (PackedScene) var explosion 



# Called when the node enters the scene tree for the first time.
func _ready():
	Ship = null
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if self.position.distance_to(Ship.position) >= threshold_range:
		on_far_dist(delta)
	else:
		on_near_dist(delta)
	
	if len(get_overlapping_bodies()) >0:
		for i in get_overlapping_bodies():
			if i.name == "Ship":
				Ship.health -= 10
		Ship.score+=1
		queue_free()
		var expl = explosion.instance()
		expl.position = position
		get_node("/root").add_child(expl)
		
	elif len(get_overlapping_areas()) > 0:
		Ship.score+=1
		queue_free()
		var expl = explosion.instance()
		expl.position = position
		get_node("/root").add_child(expl)
	pass
	
	

func start(ship):
	Ship = ship
	

func on_far_dist(delta):
	dir = lerp(dir, (Ship.position - self.position).normalized(), 0.2)
	self.position+= dir*missile_vel*delta
	self.look_at(Ship.position)
	
func on_near_dist(delta):
	self.position+= dir*missile_vel*delta
	self.look_at(Ship.position)
	

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free() # Replace with function body.
