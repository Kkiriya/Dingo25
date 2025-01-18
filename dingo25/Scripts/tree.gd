extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Left == true, Right == false
func Create_Platform(Left: bool) -> void:
	#When clicked on "x" on keyboard
	#Actionner animation 1 fois
	#Rendre la platforme solide et visible
	if Left:
		$Platform.visible = true
		
	else:
		$Platform.visible = true

	
	
