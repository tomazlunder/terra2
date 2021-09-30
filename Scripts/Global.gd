extends Node

signal village_sent_signal(village)
signal resource_tile_signal(_resourceTile)
signal resource_notile_click
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const secondsPerDay = 60.0
var perSecond

# Called when the node enters the scene tree for the first time.
func _ready():
	perSecond = 1/secondsPerDay
	pass # Replace with function body.

func sendVillageSignal(_village):
	#print("signal sent")
	emit_signal("village_sent_signal", _village)
	
func sendResourceTileSignal(_resourceTile):
	emit_signal("resource_tile_signal", _resourceTile)
	
func sendResourceNoTileClick():
	emit_signal("resource_notile_click")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
