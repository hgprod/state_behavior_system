@icon("res://hg_lib/icons/state_event.svg")
class_name StateEvent extends Node

@export var true_state: String
@export var false_state: String

func test_event() -> bool:
	return _test_event()

func _test_event() -> bool:
	return false
