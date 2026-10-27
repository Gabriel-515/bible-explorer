extends Node2D

const SCRIPTURE_PATH := "res://data/scripture/genesis_1_web.json"

var scripture_data: Dictionary = {}
var verse_label: Label
var scroll: ScrollContainer


func _ready() -> void:
	_load_scripture()
	_build_ui()


func _load_scripture() -> void:
	var file := FileAccess.open(SCRIPTURE_PATH, FileAccess.READ)
	if file == null:
		push_error("CH1-VS1A: Genesis 1 data could not be opened.")
		return
	var parsed = JSON.parse_string(file.get_as_text())
	if parsed is not Dictionary:
		push_error("CH1-VS1A: Genesis 1 data is invalid.")
		return
	scripture_data = parsed
	var verses = scripture_data.get("verses", [])
	if not verses is Array or verses.size() != 31:
		push_error("CH1-VS1A: Genesis 1 must contain verses 1–31.")


func _build_ui() -> void:
	var background := ColorRect.new()
	background.name = "ReaderBackground"
	background.position = Vector2.ZERO
	background.size = Vector2(384, 216)
	background.color = Color(0.018, 0.027, 0.043, 1.0)
	add_child(background)

	var title := Label.new()
	title.name = "Title"
	title.position = Vector2(12, 6)
	title.size = Vector2(360, 18)
	title.text = "GENESIS 1"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_color_override("font_color", Color(0.86, 0.92, 0.83))
	title.add_theme_font_size_override("font_size", 12)
	add_child(title)

	var source := Label.new()
	source.name = "TranslationSource"
	source.position = Vector2(12, 24)
	source.size = Vector2(360, 14)
	source.text = str(scripture_data.get("translation", "Translation unavailable")) + " — TECHNICAL SLICE"
	source.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	source.add_theme_color_override("font_color", Color(0.55, 0.66, 0.69))
	source.add_theme_font_size_override("font_size", 7)
	add_child(source)

	scroll = ScrollContainer.new()
	scroll.name = "VerseScroll"
	scroll.position = Vector2(12, 42)
	scroll.size = Vector2(360, 136)
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	add_child(scroll)

	verse_label = Label.new()
	verse_label.name = "VerseText"
	verse_label.custom_minimum_size = Vector2(342, 0)
	verse_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	verse_label.add_theme_color_override("font_color", Color(0.88, 0.87, 0.78))
	verse_label.add_theme_font_size_override("font_size", 8)
	verse_label.text = _format_verses()
	scroll.add_child(verse_label)

	var back_button := Button.new()
	back_button.name = "BackToHubButton"
	back_button.position = Vector2(12, 184)
	back_button.size = Vector2(112, 24)
	back_button.text = "BACK TO HUB"
	back_button.add_theme_font_size_override("font_size", 8)
	back_button.pressed.connect(_back_to_hub)
	add_child(back_button)

	var page_up := Button.new()
	page_up.name = "PageUpButton"
	page_up.position = Vector2(264, 184)
	page_up.size = Vector2(48, 24)
	page_up.text = "UP"
	page_up.add_theme_font_size_override("font_size", 8)
	page_up.pressed.connect(_page_up)
	add_child(page_up)

	var page_down := Button.new()
	page_down.name = "PageDownButton"
	page_down.position = Vector2(318, 184)
	page_down.size = Vector2(54, 24)
	page_down.text = "DOWN"
	page_down.add_theme_font_size_override("font_size", 8)
	page_down.pressed.connect(_page_down)
	add_child(page_down)


func _format_verses() -> String:
	var lines: PackedStringArray = []
	for verse in scripture_data.get("verses", []):
		lines.append("%d  %s" % [int(verse.get("verse", 0)), verse.get("text", "")])
	return "\n\n".join(lines)


func _page_up() -> void:
	scroll.scroll_vertical = maxi(0, scroll.scroll_vertical - 112)


func _page_down() -> void:
	scroll.scroll_vertical = mini(scroll.get_v_scroll_bar().max_value as int, scroll.scroll_vertical + 112)


func _back_to_hub() -> void:
	get_tree().change_scene_to_file("res://scenes/chapter1/spaceship_hub.tscn")
