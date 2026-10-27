extends Node

const SAVE_PATH := "user://ch1_vs1a_state.cfg"

var has_saved_eden_position := false
var eden_position := Vector2.ZERO


func _ready() -> void:
	_load_state()


func save_eden_position(position: Vector2) -> void:
	has_saved_eden_position = true
	eden_position = position
	_save_state()


func get_eden_position(fallback: Vector2) -> Vector2:
	return eden_position if has_saved_eden_position else fallback


func _load_state() -> void:
	var config := ConfigFile.new()
	if config.load(SAVE_PATH) != OK:
		has_saved_eden_position = false
		eden_position = Vector2.ZERO
		return
	has_saved_eden_position = config.get_value("chapter1", "has_saved_eden_position", false)
	eden_position = config.get_value("chapter1", "eden_position", Vector2.ZERO)


func _save_state() -> void:
	var config := ConfigFile.new()
	config.set_value("chapter1", "has_saved_eden_position", has_saved_eden_position)
	config.set_value("chapter1", "eden_position", eden_position)
	config.save(SAVE_PATH)
