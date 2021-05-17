extends Spatial


export var rotation_speed = PI
export var max_zoom = 1
export var min_zoom = 0.1
export var zoom_speed = 0.09
var zoom = 1.5
var mouse_control = true
var mouse_sensitivity = 0.005
var invert_y = false
var invert_x = false

func _process(delta):
	if !mouse_control:
		get_input_keyboard(delta)
	$Inner_gimble.rotation.x = clamp($Inner_gimble.rotation.x,-1.4,1.4)
	scale = lerp(scale, Vector3.ONE * zoom, zoom_speed)


func _unhandled_input(event):
	if mouse_control and event is InputEventMouseMotion:
		if event.relative.x != 0:
			var dir = 1 if invert_x else -1
			rotate_object_local(Vector3.UP,dir *event.relative.x * mouse_sensitivity)
		if event.relative.y != 0:
			var dir = 1 if invert_y else -1
			var y_rotation = clamp(event.relative.y,-30,30)
			$Inner_gimble.rotate_object_local(Vector3.RIGHT, dir * y_rotation * mouse_sensitivity)
	if event.is_action_pressed("zoom_in"):
		zoom -= zoom_speed
	if event.is_action_pressed("zoom_out"):
		zoom += zoom_speed
	zoom = clamp(zoom,min_zoom,max_zoom)


func get_input_keyboard(delta):
	var y_rotation = 0
	if Input.is_action_pressed("right"):
		y_rotation += 1
	if Input.is_action_pressed("left"):
		y_rotation += -1
	rotate_object_local(Vector3.UP, y_rotation * rotation_speed * delta)
	
	var x_rotation = 0
	if Input.is_action_pressed("up"):
		x_rotation += 1
	if Input.is_action_pressed("down"):
		x_rotation -= 1
	$Inner_gimble.rotate_object_local(Vector3.RIGHT, x_rotation * rotation_speed * delta)
