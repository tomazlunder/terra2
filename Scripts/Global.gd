extends Node

signal village_sent_signal(_village)
signal resource_tile_signal(_resourceTile, _village)
signal resource_notile_click
signal change_to_map_signal
signal change_to_resources_signal
signal change_game_speed_signal(_gameSpeed)
signal change_day_percent(_percent)

const secondsPerDay = 20.0
var perSecond

func _ready():
	perSecond = 1/secondsPerDay

func sendVillageSignal(_village):
	emit_signal("village_sent_signal", _village)
	
func sendResourceTileSignal(_resourceTile, _village):
	emit_signal("resource_tile_signal", _resourceTile, _village)
	
func sendResourceNoTileClick():
	emit_signal("resource_notile_click")
	
func changeToMap():
	emit_signal("change_to_map_signal")

func changeToResources():
	emit_signal("change_to_resources_signal")
	
func changeGameSpeed(_gameSpeed):
	emit_signal("change_game_speed_signal", _gameSpeed)
	
func changeDayPercent(_percent):
	emit_signal("change_day_percent", _percent)
