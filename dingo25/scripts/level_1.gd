extends Node
@onready var player = get_node("Player")
@onready var respawnPoint = get_node("RespawnPoint")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Input.is_action_just_pressed("reset level"):
		player.position = respawnPoint.location
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
