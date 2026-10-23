extends Node2D

const DEBUG_TOGGLE_KEY := KEY_F3

@export var start_in_decomposed_mode := true

@onready var benchmark: Sprite2D = $EdenMasterPanorama
@onready var decomposed_layers: Node2D = $DecomposedLayers
@onready var camera: Camera2D = $World/Astronaut/Camera2D

var decomposed_mode := true
var reference_camera_x := 0.0

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


func _process(_delta: float) -> void:
	var camera_delta := camera.global_position.x - reference_camera_x
	for layer_data in parallax_layers:
		var layer: Node2D = layer_data["node"]
		var factor: float = layer_data["factor"]
		layer.position.x = (1.0 - factor) * camera_delta


func _unhandled_key_input(event: InputEvent) -> void:
	if event.pressed and not event.echo and event.keycode == DEBUG_TOGGLE_KEY:
		set_decomposed_mode(not decomposed_mode)
		get_viewport().set_input_as_handled()


func set_decomposed_mode(enabled: bool) -> void:
	decomposed_mode = enabled
	decomposed_layers.visible = decomposed_mode
	benchmark.visible = not decomposed_mode
	print("EDEN VIEW: ", "DECOMPOSED" if decomposed_mode else "BENCHMARK", " (F3 toggles)")
