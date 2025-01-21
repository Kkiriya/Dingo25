extends Area2D
class_name InteractionArea

@export var action_name = "Interact"
var interact: Callable = func():
	pass
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_body_entered(body) -> void:
	InteractionManager.register_area(self)


func _on_body_exited(body) -> void:
	InteractionManager.unregister_area(self)
