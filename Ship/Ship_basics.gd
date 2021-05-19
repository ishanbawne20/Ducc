extends KinematicBody2D


export var speed = 300
var vel = Vector2(0,0)
export (PackedScene) var Bullet
onready var bullet_container = get_node("Bullet_container")
var score = 0
var health = 100
export (PackedScene) var explosion

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = get_viewport_rect().size/2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	alignrock()
	vel = lerp(vel,movement(),0.06) 
	move_and_slide(vel*speed,Vector2(0,0))
	
	if health <= 0 :
		var expl = explosion.instance()
		expl.position = position
		get_node("/root").add_child(expl)
		get_tree().change_scene("res://UI/StartMenu.tscn")
	pass

func movement():
	var velocity = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2(0,-1)
	if Input.is_action_pressed("ui_down"):
		velocity += Vector2(0,1)
	if Input.is_action_pressed("ui_left"):
		velocity += Vector2(-1,0)
	if Input.is_action_pressed("ui_right"):
		velocity += Vector2(1,0)
	if Input.is_action_just_pressed("shoot_bullet"):
		shoot()
	return velocity
	pass
	
func alignrock():
	self.look_at(get_global_mouse_position())
	pass
	
func shoot():
	var bullet = Bullet.instance()
	bullet_container.add_child(bullet)
	bullet.start(get_node("bullet_emitter").global_position, Vector2(0,0))
	pass
