extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var resourceTile

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setTile(_resourceTile):
	resourceTile = _resourceTile
	
func _process(delta):
	$VBox/CenterContainer/LevelLabel.text = str(resourceTile.level)
	$VBox/PDContainer/ProductionPDLabel.text = str(resourceTile.getProductionPerDay()) + " /Day"
	$VBox/WorkersContainer/WorkersLabel.text = str(resourceTile.workers) + "/" + str(resourceTile.maxWorkersPerLevel[resourceTile.level])

