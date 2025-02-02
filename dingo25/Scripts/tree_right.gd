extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "Create_Platform")
	$RightPlatform.visible = false	
	$AnimatedSprite2D.frame = 0
	$RightPlatform.get_node("CollisionShape2D").disabled = true
	$RightPlatform.get_node("Sprite2D").flip_h = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Left == true, Right == false
func Create_Platform() -> void:
	#When clicked on "x" on keyboard
	#Actionner animation 1 fois
	$AnimatedSprite2D.frame = 1
	#Rendre la platforme solide et visible
	if !$RightPlatform.visible:
		$RightPlatform.get_node("CollisionShape2D").disabled = false
		$RightPlatform.visible = true
	
	
