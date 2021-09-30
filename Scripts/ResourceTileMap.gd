extends TileMap

onready var CentreHex = tile_set.tile_get_texture(0).get_size()/2

func _ready():
	position -= CentreHex

func FindCell(Mousepos):
	Mousepos += CentreHex
	var LeftHand = true
	var Cell = world_to_map(Mousepos)
	
	var DangerRows = tile_set.tile_get_texture(0).get_size().y - cell_size.y
	var LocalMousepos = Mousepos - map_to_world(Cell)
	if LocalMousepos.y < DangerRows:
		var TopMiddleOfCell = cell_size.x/2
		var GradientOfDangerLine = DangerRows/TopMiddleOfCell
		var xPosToCheck = LocalMousepos.x
		if xPosToCheck > TopMiddleOfCell:
			xPosToCheck = cell_size.x - xPosToCheck
			LeftHand = false
		#If this is true: we have the wrong cell, have to correct
		if (DangerRows - LocalMousepos.y) > GradientOfDangerLine*xPosToCheck:
			if LeftHand:
				if fmod(Cell.y,2) == 0:
					Cell += Vector2(-1,-1)
				else: 
					Cell += Vector2(0,-1)
			else:
				if fmod(Cell.y,2) == 0:
					Cell += Vector2(0,-1)
				else: 
					Cell += Vector2(1,-1)
	return Cell
