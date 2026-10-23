extends CharacterBody2D

@export var walk_speed := 92.0
@export var stop_distance := 2.0
@export var walk_min_x := 24.0
@export var walk_max_x := 1128.0

var target_x := 0.0
var fixed_y := 0.0
var precise_x := 0.0


func _ready() -> void:
	fixed_y = roundf(global_position.y)
	target_x = roundf(global_position.x)
	precise_x = target_x
	global_position = Vector2(target_x, fixed_y)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			set_walk_target(event.position)
	elif event is InputEventScreenTouch and event.pressed:
		set_walk_target(event.position)


func _physics_process(delta: float) -> void:
	var distance := target_x - precise_x
	if absf(distance) <= stop_distance:
		precise_x = target_x
		global_position = Vector2(target_x, fixed_y)
		velocity = Vector2.ZERO
		return

	var previous_x := precise_x
	precise_x = move_toward(precise_x, target_x, walk_speed * delta)
	velocity = Vector2((precise_x - previous_x) / maxf(delta, 0.001), 0.0)
	global_position = Vector2(roundf(precise_x), fixed_y)


func set_walk_target(screen_position: Vector2) -> void:
	var world_position := get_viewport().get_canvas_transform().affine_inverse() * screen_position
	target_x = roundf(clampf(world_position.x, walk_min_x, walk_max_x))
