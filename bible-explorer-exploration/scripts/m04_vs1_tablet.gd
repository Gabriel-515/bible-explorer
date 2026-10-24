extends Area2D

const TABLET_ID := "m04_vs1_tablet_i"
const SCANNER_DURATION_SECONDS := 7.0

var player_nearby := false
var scan_button: Button
var proximity_label: Label
var scanner_panel: ColorRect
var scanner_label: Label
var scanner_timer: Timer


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	_build_scanner_ui()
	_refresh_interaction_label()


func _unhandled_key_input(event: InputEvent) -> void:
	if not player_nearby:
		return
	if event.pressed and not event.echo and (event.keycode == KEY_E or event.keycode == KEY_ENTER):
		_scan_tablet()
		get_viewport().set_input_as_handled()


func _on_body_entered(body: Node) -> void:
	if body.name != "Astronaut":
		return
	player_nearby = true
	_refresh_interaction_label()
	_set_prompt_visible(true)


func _on_body_exited(body: Node) -> void:
	if body.name != "Astronaut":
		return
	player_nearby = false
	_set_prompt_visible(false)


func _scan_tablet() -> void:
	var state = get_node_or_null("/root/M04VS1State")
	if state == null:
		push_error("M04-VS1: M04VS1State autoload is missing.")
		return

	if not state.has_record(TABLET_ID):
		state.record_tablet(TABLET_ID, {
			"source_family": "GENESIS",
			"scripture_range": "Genesis 1:1-5",
			"sequence_marker": "I",
			"fragment_semantic_anchor": "light called into being",
			"archive_reconstruction": "QUEUED",
		})

	_show_scanner_readout()
	_refresh_interaction_label()


func _build_scanner_ui() -> void:
	var canvas := CanvasLayer.new()
	canvas.name = "M04VS1ScannerLayer"
	canvas.layer = 30
	add_child(canvas)

	var root := Control.new()
	root.name = "ScannerUI"
	root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	canvas.add_child(root)

	proximity_label = Label.new()
	proximity_label.name = "ProximityLabel"
	proximity_label.position = Vector2(174, 166)
	proximity_label.size = Vector2(200, 14)
	proximity_label.text = "ARCHIVAL MATERIAL DETECTED"
	proximity_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	proximity_label.add_theme_color_override("font_color", Color(0.55, 0.95, 1.0))
	proximity_label.add_theme_font_size_override("font_size", 7)
	proximity_label.visible = false
	root.add_child(proximity_label)

	scan_button = Button.new()
	scan_button.name = "ScanButton"
	scan_button.position = Vector2(302, 184)
	scan_button.size = Vector2(72, 24)
	scan_button.text = "SCAN"
	scan_button.visible = false
	scan_button.pressed.connect(_scan_tablet)
	root.add_child(scan_button)

	scanner_panel = ColorRect.new()
	scanner_panel.name = "ScannerPanel"
	scanner_panel.position = Vector2(152, 46)
	scanner_panel.size = Vector2(222, 112)
	scanner_panel.color = Color(0.01, 0.035, 0.055, 0.93)
	scanner_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	scanner_panel.visible = false
	root.add_child(scanner_panel)

	scanner_label = Label.new()
	scanner_label.name = "ScannerReadout"
	scanner_label.position = Vector2(8, 7)
	scanner_label.size = Vector2(206, 98)
	scanner_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	scanner_label.add_theme_color_override("font_color", Color(0.55, 0.95, 1.0))
	scanner_label.add_theme_font_size_override("font_size", 7)
	scanner_panel.add_child(scanner_label)

	scanner_timer = Timer.new()
	scanner_timer.name = "ScannerTimer"
	scanner_timer.one_shot = true
	scanner_timer.wait_time = SCANNER_DURATION_SECONDS
	scanner_timer.timeout.connect(_hide_scanner)
	add_child(scanner_timer)


func _show_scanner_readout() -> void:
	scanner_label.text = """MATERIAL ANALYSIS: STONE
ARCHIVAL SOURCE CORRELATION: GENESIS
CORRELATION RANGE: GENESIS 1:1-5
SEQUENCE MARKER: I
FRAGMENT SEMANTIC: LIGHT CALLED INTO BEING
ARCHIVE RECONSTRUCTION: QUEUED

ARCHIVIST: "The burn pattern has no heat source.""""
	scanner_panel.visible = true
	scanner_timer.start()


func _hide_scanner() -> void:
	scanner_panel.visible = false


func _set_prompt_visible(visible_now: bool) -> void:
	proximity_label.visible = visible_now
	scan_button.visible = visible_now


func _refresh_interaction_label() -> void:
	var state = get_node_or_null("/root/M04VS1State")
	var already_recorded := state != null and state.has_record(TABLET_ID)
	if scan_button != null:
		scan_button.text = "REVIEW" if already_recorded else "SCAN"
