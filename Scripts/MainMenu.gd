extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var gameScene = preload("res://Scenes/Game.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_PlayButton_pressed():
	#var gameSceneInstance = gameScene.instance()
	get_tree().change_scene("res://Scenes/GameScene.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
