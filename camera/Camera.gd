extends Camera2D

var player

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]

func _process(_delta):
	global_position.x = player.global_position.x
