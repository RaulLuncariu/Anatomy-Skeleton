extends Camera2D


onready var target = $Inner_gimble
var target_return_enabled = true
var target_return_rate = 0.02
var min_zoom = 0.5
var max_zoom = 2
var zoom_sensitivity = 10
var zoom_speed = 0.05

var events = {}
var last_drag_distance = 0

func _process(delta):
	if target and target_return_enabled and events.size() == 0:
	   target.position = lerp(target.position, get_node(target).position, target_return_rate)
		
func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			events[event.index] = event
		else:
			events.erase(event.index)
			
	if event is InputEventScreenDrag:
		events[event.index] = event
		if events.size() == 1:
			target.position += event.relative * target.zoom.x

