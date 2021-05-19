extends Control


onready var score = get_node("Score")
onready var health = get_node("TextureProgress")

onready var ship = get_node("/root/Main/Ship")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score.text = "Score : " + str(ship.score)
	health.value = ship.health
	pass
