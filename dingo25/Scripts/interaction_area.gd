extends Area2D
class_name InteractionArea

@export var action_name = "Interact"
var interact: Callable = func():
	pass

func _on_body_entered(body) -> void:
	InteractionManager.register_area(self)
	


func _on_body_exited(body) -> void:
	InteractionManager.unregister_area(self)
	
