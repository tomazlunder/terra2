extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("change_day_percent",self,"changePercent")

func changePercent(percent):
	self.value = percent

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
