extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_ButtonMap_pressed():
	Global.changeToMap()
	$ResourceTileControlNode.hide()
	$ResourcesControlNode.hide()

func _on_ButtonResources_pressed():
	Global.changeToResources()
	$ResourcesControlNode.show()

func _on_PauseButton_pressed():
	Global.changeGameSpeed(0)

func _on_OneXButton_pressed():
	Global.changeGameSpeed(1)

func _on_TwoXButton_pressed():
	Global.changeGameSpeed(2)

func _on_ThreeXButton_pressed():
	Global.changeGameSpeed(2)
