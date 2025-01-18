extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LeftPlatform.visible = false	
	$RightPlatform.visible = false
	$LeftPlatform.get_node("CollisionShape2D").disabled = true
	$RightPlatform.get_node("CollisionShape2D").disabled = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta):
	if Input.is_action_pressed("WaterTree"):
		Create_Platform(true)
#Left == true, Right == false
func Create_Platform(Left: bool) -> void:
	#When clicked on "x" on keyboard
	#Actionner animation 1 fois
	#Rendre la platforme solide et visible
	if Left:
		$LeftPlatform.visible = true		
		$LeftPlatform.get_node("CollisionShape2D").disabled = false
	else:
		$RightPlatform.visible = true
		$RightPlatform.get_node("CollisionShape2D").disabled = false
	
	
