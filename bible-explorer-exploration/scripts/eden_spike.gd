extends Node2D

const DEBUG_TOGGLE_KEY := KEY_F3

@export var start_in_decomposed_mode := true

@onready var benchmark: Sprite2D = $EdenMasterPanorama
@onready var decomposed_layers: Node2D = $DecomposedLayers
@onready var player: CharacterBody2D = $World/Astronaut
@onready var camera: Camera2D = $World/Astronaut/Camera2D

var decomposed_mode := true
var reference_camera_x := 0.0
var return_to_ship_button: Button

var parallax_layers: Array[Dictionary] = []


func _ready() -> void:
	reference_camera_x = camera.global_position.x
	parallax_layers = [
		{"node": $DecomposedLayers/Far, "factor": 0.960},
		{"node": $DecomposedLayers/MidFar, "factor": 0.975},
		{"node": $DecomposedLayers/Mid, "factor": 0.988},
		{"node": $DecomposedLayers/Playable, "factor": 1.000},
		{"node": $DecomposedLayers/Foreground, "factor": 1.006},
	]
	set_decomposed_mode(start_in_decomposed_mode)
	_build_chapter_navigation()
	_restore_eden_position()


func _process(_delta: float) -> void:
	var camera_delta := camera.global_position.x - reference_camera_x
	for layer_data in parallax_layers:
		var layer: Node2D = layer_data["node"]
		var factor: float = layer_data["factor"]
		layer.position.x = (1.0 - factor) * camera_delta
	_refresh_chapter_navigation()


func _unhandled_key_input(event: InputEvent) -> void:
	if event.pressed and not event.echo and event.keycode == DEBUG_TOGGLE_KEY:
		set_decomposed_mode(not decomposed_mode)
		get_viewport().set_input_as_handled()


func set_decomposed_mode(enabled: bool) -> void:
	decomposed_mode = enabled
	decomposed_layers.visible = decomposed_mode
	benchmark.visible = not decomposed_mode
	print("EDEN VIEW: ", "DECOMPOSED" if decomposed_mode else "BENCHMARK", " (F3 toggles)")


func _build_chapter_navigation() -> void:
	var canvas := CanvasLayer.new()
	canvas.name = "ChapterNavigationLayer"
	canvas.layer = 25
	add_child(canvas)

	return_to_ship_button = Button.new()
	return_to_ship_button.name = "ReturnToShipButton"
	return_to_ship_button.position = Vector2(272, 8)
	return_to_ship_button.size = Vector2(104, 24)
	return_to_ship_button.text = "RETURN TO SHIP"
	return_to_ship_button.add_theme_font_size_override("font_size", 7)
	return_to_ship_button.visible = false
	return_to_ship_button.pressed.connect(_return_to_ship)
	canvas.add_child(return_to_ship_button)


func _refresh_chapter_navigation() -> void:
	var tablet_state = get_node_or_null("/root/M04VS1State")
	return_to_ship_button.visible = tablet_state != null and tablet_state.has_record("m04_vs1_tablet_i")


func _restore_eden_position() -> void:
	var loop_state = get_node_or_null("/root/ChapterLoopState")
	if loop_state == null or not loop_state.has_saved_eden_position:
		return
	var restored_position: Vector2 = loop_state.get_eden_position(player.global_position)
	player.global_position = restored_position
	player.fixed_y = restored_position.y
	player.precise_x = restored_position.x
	player.target_x = restored_position.x


func _return_to_ship() -> void:
	var loop_state = get_node_or_null("/root/ChapterLoopState")
	if loop_state == null:
		push_error("CH1-VS1A: ChapterLoopState autoload is missing.")
		return
	loop_state.save_eden_position(player.global_position)
	get_tree().change_scene_to_file("res://scenes/chapter1/spaceship_hub.tscn")
