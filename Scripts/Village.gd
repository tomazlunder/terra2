var villageID;
var playerID;
var coordinates;
var villageName;

#WHEAT, CLAY, WOOD, STONE, IRON
var resources = []
var maxResources = []

var resourceTiles = []
var buildings = []
var units = []

var perDay = []

#Population
var workers
var freeWorkers
	
func initialize(_villageID, _playerID, _coordinates, _villageName, _resources, _resourceTileTypes):
	resources = [0,0,0,0,0]
	maxResources = [2000,2000,2000,2000,2000]
	perDay = [0,0,0,0,0]
	
	workers = 10
	freeWorkers = workers
	
	villageID = _villageID
	playerID = _playerID
	coordinates = _coordinates
	villageName = _villageName
	resources = _resources
	
	var resourceTypeShuffeledList = shuffleList(_resourceTileTypes)
	for resType in resourceTypeShuffeledList:
		var resourceTileInstance = load("res://Scripts/ResourceTile.gd").new()
		resourceTileInstance.initialize(resType)
		resourceTiles.append(resourceTileInstance)
	
func update(delta):
	var newPerDay = [0,0,0,0,0]
	
	for tile in resourceTiles:
		var ppd = tile.getProductionPerDay()
		newPerDay[tile.type-1] += ppd
		resources[tile.type-1] += ppd * Global.perSecond * delta
	
	#print(resources)
	perDay = newPerDay
	#Global.sendVillageSignal(self)
	
func shuffleList(list):
	randomize()
	var shuffledList = [] 
	var indexList = range(list.size())
	for i in range(list.size()):
		var x = randi()%indexList.size()
		shuffledList.append(list[indexList[x]])
		indexList.remove(x)
	return shuffledList
