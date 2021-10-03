extends Node2D

const VillageCoordinates = Vector2(0,0)
const ResourceCoordinates = [
	Vector2(-1,-2),
	Vector2(0,-2),
	Vector2(1,-2),
	Vector2(-2,-1),
	Vector2(-1,-1),
	Vector2(0,-1),
	Vector2(1,-1),
	Vector2(-2,0),
	Vector2(-1,0),
	Vector2(1,0),
	Vector2(2,0),
	Vector2(-2,1),
	Vector2(-1,1),
	Vector2(0,1),
	Vector2(1,1),
	Vector2(-1,2),
	Vector2(0,2),
	Vector2(1,2)
]

var village
#Coordinates ... ResourceTile
var TileDict = {}

func _ready():
	Global.connect("village_sent_signal", self, "populateTilemap")

#Get village info and set the tilemap
func populateTilemap(_village):	
	village = _village
	
	$ResourceTileMap.clear()
	#Place village
	$ResourceTileMap.set_cell(0, 0, 0)

	#Place resource tiles
	var i = 0
	for resourceTile in _village.resourceTiles:
		var type = resourceTile.type

		var coordinates = ResourceCoordinates[i]
		$ResourceTileMap.set_cell(coordinates.x, coordinates.y, type)
		TileDict[coordinates] = resourceTile
		
		#Creating UI Tile Markers
		var tileUIinstance = load("res://Scenes/TileUI.tscn").instance()
		tileUIinstance.setTile(resourceTile)

		tileUIinstance.hide()
		tileUIinstance.show()
		var realCords = $ResourceTileMap.map_to_world(coordinates)
		var tileSize = $ResourceTileMap.tile_set.tile_get_texture(0).get_size().y
		#Offset?? But not working, fixed with some hardcoded numbers (10,2)
		var bla = tileUIinstance.get_child(0).rect_size
		#print(bla)
		realCords = realCords - Vector2(bla.x+10,bla.y*2)
		tileUIinstance.set_position(realCords)
		$TileUIControlNode.add_child(tileUIinstance)
		
		i = i+1

#Detect click on tilemap
func _unhandled_input(event):
	if !is_visible():
		return
		
	if event.is_action_released("leftclick"):
		var Cell = $ResourceTileMap.FindCell(get_global_mouse_position())
		#print(Cell)
		var Bla = $ResourceTileMap.get_cellv(Cell)
		#print(Bla)
		if(Bla >= 1):
			var resourceTile = TileDict[Cell]
			Global.sendResourceTileSignal(resourceTile,village)
		elif(Bla < 0):
			Global.sendResourceNoTileClick()
		
