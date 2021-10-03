var type
var level
var maxLevel

var maxWorkersPerLevel
var productionPerWorkerPerLevel

var workers

var tileName

func initialize(_type):
	level = 0
	maxLevel = 10
	workers = 0
	
	type = _type
	
	#TODO: This is temp
	maxWorkersPerLevel = [5,10,15,20,25,30,35,40,45,50]
	productionPerWorkerPerLevel = [10,11,12,13,14,15,16,17,18,19,20]
	
	if(type == 1):
		tileName = "Wheat field"
		
	if(type == 2):
		tileName = "Wood field"
		
	if(type == 3):
		tileName = "Clay field"
		
	if(type == 4):
		tileName = "Stone field"
		
	if(type == 5):
		tileName = "Iron field"
		
func getProductionPerDay():
	 return productionPerWorkerPerLevel[level] * workers
	
func getMaxWorkers():
	return maxWorkersPerLevel[level]
	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
