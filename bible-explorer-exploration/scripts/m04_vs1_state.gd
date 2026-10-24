extends Node

const SAVE_PATH := "user://m04_vs1_state.cfg"

var tablet_records: Dictionary = {}


func _ready() -> void:
	_load_state()


func record_tablet(tablet_id: String, payload: Dictionary) -> void:
	tablet_records[tablet_id] = payload.duplicate(true)
	_save_state()


func has_record(tablet_id: String) -> bool:
	return tablet_records.has(tablet_id)


func get_record(tablet_id: String) -> Dictionary:
	var record = tablet_records.get(tablet_id, {})
	return record.duplicate(true) if record is Dictionary else {}


func has_genesis_context() -> bool:
	return not tablet_records.is_empty()


func get_ship_context() -> Dictionary:
	return {
		"source_family": "GENESIS",
		"context_required": has_genesis_context(),
		"tablet_records": tablet_records.duplicate(true),
	}


func _load_state() -> void:
	var config := ConfigFile.new()
	if config.load(SAVE_PATH) != OK:
		tablet_records = {}
		return

	var saved_records = config.get_value("m04_vs1", "tablet_records", {})
	tablet_records = saved_records.duplicate(true) if saved_records is Dictionary else {}


func _save_state() -> void:
	var config := ConfigFile.new()
	config.set_value("m04_vs1", "tablet_records", tablet_records)
	config.save(SAVE_PATH)
