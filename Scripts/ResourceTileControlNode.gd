extends Control

var resourceTile
var village

var regexInt = RegEx.new()


func _ready():
	Global.connect("resource_tile_signal",self,"setTileUI")
	Global.connect("resource_notile_click", self, "_on_CloseButton_pressed")
	
	regexInt.compile("^[0-9]*$")

	hide()

func setTileUI(_resourceTile, _village):
	resourceTile = _resourceTile
	village = _village
	
	$ResourceTilePanel/ResourceTileVBox/NameAndLvlHBox/TileNameLabel.text = resourceTile.tileName
	$ResourceTilePanel/ResourceTileVBox/NameAndLvlHBox/TileLevelLabel.text = "LVL: " + str(resourceTile.level)
	
	$ResourceTilePanel/ResourceTileVBox/PerWorkerHBox/PerWorkerLabel.text = ":" + str(resourceTile.productionPerWorkerPerLevel[resourceTile.level]) + " /Day"
	$ResourceTilePanel/ResourceTileVBox/MaxWorkersHBox/MaxWorkersLabel.text = ":" + str(resourceTile.maxWorkersPerLevel[resourceTile.level])
	$ResourceTilePanel/ResourceTileVBox/CurrentWorkersHBox/CurrentWorkersLabel.text = ":" + str(resourceTile.workers)
	
	$ResourceTilePanel/ResourceTileVBox/TotalProductionHBox/TotalProductionLabel.text = ":" + str(resourceTile.getProductionPerDay())
	
	$ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/NumWorkersTextEdit.text = str(resourceTile.workers)
	
	setButtonSettings()
	
	show()

func setButtonSettings():
	var TextEditElement = $ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/NumWorkersTextEdit
	var numText = int(TextEditElement.text)
	var freeWorkerChange = (numText - resourceTile.workers)
	
	
	$ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/ButtonAddWorker.disabled = true
	if(resourceTile.workers < resourceTile.getMaxWorkers()) && (village.freeWorkers >= 0) && (int(TextEditElement.text) < resourceTile.getMaxWorkers()) && (freeWorkerChange < village.freeWorkers):
		$ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/ButtonAddWorker.disabled = false
		
	$ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/ButtonRemoveWorker.disabled = true
	if(int(TextEditElement.text) > 0):
		$ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/ButtonRemoveWorker.disabled = false
		
	#Disable/enable confirm button
	$ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/ButtonConfirmWorkers.disabled = true
	if(freeWorkerChange != 0):
		$ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/ButtonConfirmWorkers.disabled = false
		
func _on_CloseButton_pressed():
	hide()

func _on_NumWorkersTextEdit_text_changed():
	var TextEditElement = $ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/NumWorkersTextEdit
	var text = TextEditElement.text
	
	#If textedit text is not a number
	if !regexInt.search(text):
		TextEditElement.text = resourceTile.workers
		return
	
	var numText = int(text)
	
	#Textedit value bigger than max possible workers per tile
	if(numText > resourceTile.getMaxWorkers()):
		numText = resourceTile.workers + village.freeWorkers
		if(numText > resourceTile.getMaxWorkers()):
			numText = resourceTile.getMaxWorkers()
			
	if(numText > resourceTile.workers + village.freeWorkers):
		numText = resourceTile.workers + village.freeWorkers
		if(numText > resourceTile.getMaxWorkers()):
			numText = resourceTile.getMaxWorkers()
			
	TextEditElement.text = str(numText)
	setButtonSettings()


func _on_ButtonRemoveWorker_pressed():
	var TextEditElement = $ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/NumWorkersTextEdit
	var numText = int(TextEditElement.text)
	
	if(numText >= 1):
		numText -= 1
		TextEditElement.text = str(numText)
		setButtonSettings()


func _on_ButtonAddWorker_pressed():
	var TextEditElement = $ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/NumWorkersTextEdit
	var numText = int(TextEditElement.text)
	var currentAddedWorkers = (numText - resourceTile.workers) + 1

	if(currentAddedWorkers <= village.freeWorkers):
		TextEditElement.text = str(numText + 1)
		setButtonSettings()


func _on_ButtonConfirmWorkers_pressed():
	var TextEditElement = $ResourceTilePanel/ResourceTileVBox/SetWorkersHBox/NumWorkersTextEdit
	var numText = int(TextEditElement.text)
	var freeWorkerChange = (numText - resourceTile.workers)
	
	resourceTile.workers += freeWorkerChange
	village.freeWorkers -= freeWorkerChange

	hide()

