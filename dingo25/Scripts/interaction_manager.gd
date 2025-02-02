extends Node2D

var player : CharacterBody2D = null
@onready var IsPlayerInScene : bool = player != null
@onready var label = $Label

const base_text:String = "[E] to "

var active_areas:Array = []
var can_interact:bool = true

func _ready():
	# Connect the signal from the level 1 node
	if not Global.is_connected("player_ready", Callable(self, "_on_player_ready")):
		Global.connect("player_ready", Callable(self, "_on_player_ready"))

func register_area(Area: InteractionArea):
	active_areas.push_back(Area)
	
func unregister_area(Area: InteractionArea):
	var index = active_areas.find(Area)
	if index != -1:
		active_areas.remove_at(index)
	print(active_areas.size())

func _process(delta: float):
	if active_areas.size() > 0 && can_interact:
		active_areas.sort_custom(_sort_by_distance_to_player)
		label.text = base_text + active_areas[0].action_name
		#label.global_position = active_areas[0].global_position
		#label.global_position.y -= 20
		#label.global_position.x -= label.size.x / 2
		#label.show()
	#else:
		#label.hide()
		
func _sort_by_distance_to_player(area1, area2):
	var area1_to_player = player.global_position.distance_to(area1.global_position)
	var area2_to_player = player.global_position.distance_to(area2.global_position)
	return area1_to_player < area2_to_player
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("WaterTree") && can_interact:
		if active_areas.size() > 0:
			can_interact = false
			#label.hide()			
			await active_areas[0].interact.call()
			
			can_interact = true
			
func _on_player_ready(player_node):
	player = player_node
	print("Player is now accessible: ", player.name)
