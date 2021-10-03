extends Node

var players = []
var villages = []

var time = 0
var day = 0

#Constants
const resTilesForStartingVillage = [1,1,1,1,1, 2,2,2,2, 3,3,3,3, 4,4,4,4, 5]

var currentVillage

var gameSpeed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("change_to_map_signal",self,"changeToMapView")
	Global.connect("change_to_resources_signal",self,"changeToResourceView")
	Global.connect("change_game_speed_signal",self,"changeGameSpeed")
	
	var universalUIinstance = load("res://Scenes/UniversalUI.tscn").instance()
	$CanvasLayer.add_child(universalUIinstance)
	newGame()
	pass # Replace with function body.

#Newgame
func newGame():
	#Generate map
	#Adding player's starting village to (0,0) on map
	$Map/MapTileMap.set_cell(0,0,0)
	#Create player's starting village
	var playerStartingVillage = load("res://Scripts/Village.gd").new()
	playerStartingVillage.initialize(0, 0, Vector2(0,0), "StartingVillage", [100,100,100,100,0], resTilesForStartingVillage)
	villages.append(playerStartingVillage)
	
	#Pass starting village to UI
	Global.sendVillageSignal(playerStartingVillage)
	
	currentVillage = playerStartingVillage
	
func changeToMapView():
	$Resources.hide()
	$Map.show()
	$Map/MapCamera.current = true;
	$Resources/ResourceCamera.current = false;
	
	$Map/MapCamera.position = currentVillage.coordinates
	#TODO: Center camera on current village

func changeToResourceView():
	$Map.hide()
	$Resources.show()
	
	$Resources/ResourceCamera.current = true;
	$Map/MapCamera.current = false;

func _process(delta):
	#If the game is paused
	if(gameSpeed == 0):
		return
		
	#Update time
	time+=delta * gameSpeed
	if(time>=Global.secondsPerDay):
		day+=1
		time = time - Global.secondsPerDay
		
	Global.changeDayPercent(time/Global.secondsPerDay)
		
	#Update all the villages
	for village in villages:
		village.update(delta * gameSpeed)
	

func _input(event):
	if event is InputEventKey:
		if (event as InputEventKey).scancode == KEY_ESCAPE:
			get_tree().change_scene("res://Scenes/MainMenu.tscn")
			
func changeGameSpeed(_gameSpeed):
	gameSpeed = _gameSpeed
