extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const cameraVelocity = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	#Moving the camera		
	if 	Input.is_action_pressed("game_right"):
		$MapCamera.position.x += cameraVelocity * delta
	if Input.is_action_pressed("game_left"):
		$MapCamera.position.x -= cameraVelocity * delta
	if Input.is_action_pressed("game_down"):
		$MapCamera.position.y += cameraVelocity * delta
	if Input.is_action_pressed("game_up"):
		$MapCamera.position.y -= cameraVelocity * delta
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
