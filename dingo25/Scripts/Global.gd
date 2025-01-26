extends Node

signal player_ready
var player = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_player(player_node):
	player = player_node
	emit_signal("player_ready", player)
