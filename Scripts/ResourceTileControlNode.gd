extends Control

var resourceTile

func _ready():
	Global.connect("resource_tile_signal",self,"setTileUI")
	Global.connect("resource_notile_click", self, "_on_CloseButton_pressed")
	hide()

func setTileUI(_resourceTile):
	resourceTile = _resourceTile
	
	$ResourceTilePanel/ResourceTileVBox/NameAndLvlHBox/TileNameLabel.text = resourceTile.tileName
	$ResourceTilePanel/ResourceTileVBox/NameAndLvlHBox/TileLevelLabel.text = "LVL: " + str(resourceTile.level)
	
	$ResourceTilePanel/ResourceTileVBox/PerWorkerHBox/PerWorkerLabel.text = ":" + str(resourceTile.productionPerWorkerPerLevel[resourceTile.level]) + " /Day"
	$ResourceTilePanel/ResourceTileVBox/MaxWorkersHBox/MaxWorkersLabel.text = ":" + str(resourceTile.maxWorkersPerLevel[resourceTile.level])
	$ResourceTilePanel/ResourceTileVBox/CurrentWorkersHBox/CurrentWorkersLabel.text = ":" + str(resourceTile.workers)
	
	$ResourceTilePanel/ResourceTileVBox/TotalProductionHBox/TotalProductionLabel.text = ":" + str(resourceTile.getProductionPerDay())
	
	$ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/NumWorkersTextEdit.text = str(resourceTile.workers)
	
	show()

func _on_CloseButton_pressed():
	hide()

