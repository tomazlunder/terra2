extends Node

var players = []
var villages = []

var time = 0
var day = 0

#Constants
const resTilesForStartingVillage = [1,1,1,1,1, 2,2,2,2, 3,3,3,3, 4,4,4,4, 5]

# Called when the node enters the scene tree for the first time.
func _ready():
	var universalUIinstance = load("res://Scenes/UniversalUI.tscn").instance()
	$CanvasLayer.add_child(universalUIinstance)
	newGame()
	pass # Replace with function body.

#Newgame
func newGame():
	#Generate map
	#Create player's starting village
	var playerStartingVillage = load("res://Scripts/Village.gd").new()
	playerStartingVillage.initialize(0, 0, Vector2(0,0), "StartingVillage", [100,100,100,100,0], resTilesForStartingVillage)
	villages.append(playerStartingVillage)
	
	print("test")
	
	#Pass starting village to UI
	Global.sendVillageSignal(playerStartingVillage)
	
	#Start game

func _process(delta):
	#Update all the villages
	for village in villages:
		village.update(delta)
	

func _input(event):
	if event is InputEventKey:
		if (event as InputEventKey).scancode == KEY_ESCAPE:
			get_tree().change_scene("res://Scenes/MainMenu.tscn")
