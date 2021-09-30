extends Control

var village

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("village_sent_signal", self, "setVillage")
	pass # Replace with function body.

func setVillage(_village):
	village = _village
	
func _process(delta):
	if(!village):
		return
	
	$ResourcesPanel/ResVBox/Row1HBox/PopHBox/PopLabel.text = str(village.workers)
	$ResourcesPanel/ResVBox/Row1HBox/WheatHBox/WheatLabel.text = str(round(village.resources[0])) + "/" + str(village.maxResources[0])
	$ResourcesPanel/ResVBox/Row1HBox/WoodHBox/WoodLabel.text = str(round(village.resources[1])) + "/" + str(village.maxResources[1])
	$ResourcesPanel/ResVBox/Row1HBox/ClayHBox/ClayLabel.text = str(round(village.resources[2])) + "/" + str(village.maxResources[2])
	$ResourcesPanel/ResVBox/Row1HBox/StoneHBox/StoneLabel.text = str(round(village.resources[3])) + "/" + str(village.maxResources[3])
	$ResourcesPanel/ResVBox/Row1HBox/IronHBox/IronLabel.text = str(round(village.resources[4])) + "/" + str(village.maxResources[4])
	
	$ResourcesPanel/ResVBox/Row2HBox/FreePopHBox/FreePopLabel.text = str(village.freeWorkers)
	$ResourcesPanel/ResVBox/Row2HBox/WheatPDHBox/WheatPDLabel.text = str(round(village.perDay[0]))
	$ResourcesPanel/ResVBox/Row2HBox/WoodPDHBox/WheatPDLabel.text = str(round(village.perDay[1]))
	$ResourcesPanel/ResVBox/Row2HBox/ClayPDHBox/ClayPDLabel.text = str(round(village.perDay[2]))
	$ResourcesPanel/ResVBox/Row2HBox/StonePDHBox/StonePDLabel.text = str(round(village.perDay[3]))
	$ResourcesPanel/ResVBox/Row2HBox/IronPDHBox/IronPDLabel.text = str(round(village.perDay[4]))
