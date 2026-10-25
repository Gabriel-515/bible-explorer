extends Node2D
## CHAR-VS1: isolated 2D motion feasibility preview.
## No production movement, input or story logic is changed.

@onready var visual: Sprite2D = $Character/Sprite2D
@onready var mode_label: Label = $CanvasLayer/Info/Mode

const IDLE_BREATH_FREQUENCY := 1.3
const IDLE_SCALE_AMPLITUDE := 0.012
const WALK_STEP_FREQUENCY := 8.0
const WALK_BOB_PIXELS := 1.0

var walking_preview := false
var phase := 0.0
var original_position := Vector2.ZERO
var original_scale := Vector2.ONE


func _ready() -> void:
	original_position = visual.position
	original_scale = visual.scale
	_update_mode_label()


func _process(delta: float) -> void:
	phase += delta
	if walking_preview:
		var step := sin(phase * WALK_STEP_FREQUENCY)
		visual.position = original_position + Vector2(0.0, -absf(step) * WALK_BOB_PIXELS)
		visual.scale = Vector2(
			original_scale.x * (1.0 + absf(step) * 0.008),
			original_scale.y * (1.0 - absf(step) * 0.012)
		)
	else:
		var breath := sin(phase * TAU * IDLE_BREATH_FREQUENCY)
		visual.position = original_position + Vector2(0.0, -0.25 * breath)
		visual.scale = Vector2(
			original_scale.x * (1.0 + breath * IDLE_SCALE_AMPLITUDE * 0.30),
			original_scale.y * (1.0 + breath * IDLE_SCALE_AMPLITUDE)
		)


func _unhandled_key_input(event: InputEvent) -> void:
	if event.pressed and not event.echo:
		if event.keycode == KEY_SPACE:
			_toggle_preview()
			get_viewport().set_input_as_handled()
		elif event.keycode == KEY_LEFT:
			visual.flip_h = true
			get_viewport().set_input_as_handled()
		elif event.keycode == KEY_RIGHT:
			visual.flip_h = false
			get_viewport().set_input_as_handled()


func _toggle_preview() -> void:
	walking_preview = not walking_preview
	phase = 0.0
	_update_mode_label()


func _update_mode_label() -> void:
	mode_label.text = "MODE: WALK FEEL TEST" if walking_preview else "MODE: IDLE BREATH"


func _on_toggle_pressed() -> void:
	_toggle_preview()
