extends Node2D

var context_label: Label
var open_reader_button: Button
var return_to_eden_button: Button


func _ready() -> void:
	_build_ui()
	_refresh_context()


func _build_ui() -> void:
	var background := ColorRect.new()
	background.name = "PlaceholderBackground"
	background.position = Vector2.ZERO
	background.size = Vector2(384, 216)
	background.color = Color(0.025, 0.04, 0.065, 1.0)
	add_child(background)

	var frame := ColorRect.new()
	frame.name = "ArchiveConsole"
	frame.position = Vector2(24, 30)
	frame.size = Vector2(336, 156)
	frame.color = Color(0.055, 0.09, 0.12, 1.0)
	add_child(frame)

	var title := Label.new()
	title.name = "Title"
	title.position = Vector2(36, 42)
	title.size = Vector2(312, 20)
	title.text = "SPACESHIP HUB — TECHNICAL PLACEHOLDER"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_color_override("font_color", Color(0.72, 0.94, 1.0))
	title.add_theme_font_size_override("font_size", 10)
	add_child(title)

	context_label = Label.new()
	context_label.name = "ArchiveContext"
	context_label.position = Vector2(42, 72)
	context_label.size = Vector2(300, 42)
	context_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	context_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	context_label.add_theme_color_override("font_color", Color(0.75, 0.82, 0.84))
	context_label.add_theme_font_size_override("font_size", 8)
	add_child(context_label)

	open_reader_button = Button.new()
	open_reader_button.name = "OpenGenesisReaderButton"
	open_reader_button.position = Vector2(73, 126)
	open_reader_button.size = Vector2(112, 30)
	open_reader_button.text = "OPEN GENESIS 1"
	open_reader_button.add_theme_font_size_override("font_size", 8)
	open_reader_button.pressed.connect(_open_reader)
	add_child(open_reader_button)

	return_to_eden_button = Button.new()
	return_to_eden_button.name = "ReturnToEdenButton"
	return_to_eden_button.position = Vector2(199, 126)
	return_to_eden_button.size = Vector2(112, 30)
	return_to_eden_button.text = "RETURN TO EDEN"
	return_to_eden_button.add_theme_font_size_override("font_size", 8)
	return_to_eden_button.pressed.connect(_return_to_eden)
	add_child(return_to_eden_button)


func _refresh_context() -> void:
	var tablet_state = get_node_or_null("/root/M04VS1State")
	var has_tablet_i: bool = tablet_state != null and tablet_state.has_record("m04_vs1_tablet_i")
	context_label.text = "TABLET I ARCHIVE: RECORDED\nGENESIS 1:1–5 CORRELATION AVAILABLE" if has_tablet_i else "NO ARCHIVAL CONTEXT RECORDED"
	open_reader_button.disabled = not has_tablet_i


func _open_reader() -> void:
	get_tree().change_scene_to_file("res://scenes/chapter1/genesis_reader.tscn")


func _return_to_eden() -> void:
	get_tree().change_scene_to_file("res://scenes/eden/eden_spike.tscn")
