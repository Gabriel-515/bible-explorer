extends Node2D

const CELL := Vector2(32, 44)
const SOURCE_GROUND_ROW := 40
const IDLE_ORDER := [0, 1, 2, 3, 2, 1]
const IDLE_FPS := 2.5
const WALK_FPS := 8.0
const IDLE_36: Texture2D = preload("res://artifacts/CHAR-VS2C/archivist_idle_36.png")
const WALK_36: Texture2D = preload("res://artifacts/CHAR-VS2C/archivist_walk_36.png")
const IDLE_32: Texture2D = preload("res://artifacts/CHAR-VS2C/archivist_idle_32.png")
const WALK_32: Texture2D = preload("res://artifacts/CHAR-VS2C/archivist_walk_32.png")

@onready var player: CharacterBody2D = get_parent() as CharacterBody2D
@onready var production_sprite: Sprite2D = $"../Sprite2D"

var sprite_36: AnimatedSprite2D
var sprite_32: AnimatedSprite2D
var animation_state := "idle"
var facing_left := false
var comparison_height := 36


func _ready() -> void:
	assert(get_viewport().get_visible_rect().size == Vector2(384, 216))
	assert(IDLE_36.get_size() == Vector2(128, 44))
	assert(WALK_36.get_size() == Vector2(256, 44))
	assert(IDLE_32.get_size() == Vector2(128, 44))
	assert(WALK_32.get_size() == Vector2(256, 44))
	sprite_36 = _attach_sprite("Archivist36", IDLE_36, WALK_36)
	sprite_32 = _attach_sprite("Archivist32", IDLE_32, WALK_32)
	_show_variant(36)
	_set_animation("idle")


func _attach_sprite(node_name: String, idle_sheet: Texture2D, walk_sheet: Texture2D) -> AnimatedSprite2D:
	var sprite := AnimatedSprite2D.new()
	sprite.name = node_name
	sprite.centered = false
	# Source row 40 maps to the existing player ground coordinate.
	sprite.position = Vector2(-16, -SOURCE_GROUND_ROW)
	sprite.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	sprite.sprite_frames = _make_frames(idle_sheet, walk_sheet)
	add_child(sprite)
	return sprite


func _make_frames(idle_sheet: Texture2D, walk_sheet: Texture2D) -> SpriteFrames:
	var frames := SpriteFrames.new()
	frames.remove_animation("default")
	for animation_name in ["idle", "walk"]:
		frames.add_animation(animation_name)
		frames.set_animation_loop(animation_name, true)
		frames.set_animation_speed(animation_name, IDLE_FPS if animation_name == "idle" else WALK_FPS)
		var sheet: Texture2D = idle_sheet if animation_name == "idle" else walk_sheet
		var indices: Array = IDLE_ORDER if animation_name == "idle" else [0, 1, 2, 3, 4, 5, 6, 7]
		for index in indices:
			var atlas := AtlasTexture.new()
			atlas.atlas = sheet
			atlas.region = Rect2(index * 32, 0, CELL.x, CELL.y)
			atlas.filter_clip = true
			frames.add_frame(animation_name, atlas)
	return frames


func _process(_delta: float) -> void:
	var direction := player.velocity.x
	if absf(direction) > 0.01:
		facing_left = direction < 0.0
		_set_animation("walk")
	else:
		_set_animation("idle")
	sprite_36.flip_h = facing_left
	sprite_32.flip_h = facing_left
	# The approved silhouettes are not centered within their 32px cells.
	# Compensate for the exact bounding-box shift introduced by mirroring.
	sprite_36.position.x = -18.0 if facing_left else -16.0
	sprite_32.position.x = -15.0 if facing_left else -16.0


func _set_animation(animation_name: String) -> void:
	if animation_state == animation_name and sprite_36.is_playing() and sprite_32.is_playing():
		return
	animation_state = animation_name
	sprite_36.play(animation_name)
	sprite_32.play(animation_name)


func _show_variant(height: int) -> void:
	comparison_height = height
	production_sprite.visible = height == 0
	sprite_36.visible = height == 36
	sprite_32.visible = height == 32


func _unhandled_key_input(event: InputEvent) -> void:
	if not event is InputEventKey:
		return
	var key := event as InputEventKey
	if not key.pressed or key.echo:
		return
	if key.keycode == KEY_1:
		_show_variant(36)
	elif key.keycode == KEY_2:
		_show_variant(32)
	elif key.keycode == KEY_3:
		_show_variant(0)
