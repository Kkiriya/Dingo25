extends Node2D

@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#direction the sprite faces
	if player_controller.direction == 1:
		sprite.flip_h = false
	if player_controller.direction == -1: 
		sprite.flip_h = true
	
	#movement anim
	if abs(player_controller.velocity.x) > 0.0: 
		animation_player.play("move")
	else:
		animation_player.play("idle")
	
	#jump anim
	if player_controller.velocity.y < 0:
		animation_player.play("jump")
	elif player_controller.velocity.y > 0:
		animation_player.play("fall")
