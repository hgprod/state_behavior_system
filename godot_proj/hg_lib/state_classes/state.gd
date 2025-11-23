@icon("res://hg_lib/icons/state.svg")
class_name State extends Node

var next: String = ""
var is_active: bool = false

var _machine: StateMachine

func get_machine() -> StateMachine:
	if is_instance_valid(_machine): return _machine
	if not is_inside_tree():
		push_error("State not added to main tree")
		return null
	var parent: Node = self
	while(true):
		parent = parent.get_parent()
		if not is_instance_valid(parent):
			push_error("State Machine not found in tree")
			break
		elif parent is StateMachine:
			_machine = parent as StateMachine
			return _machine
	return null

func begin_state() -> void:
	var parent := get_parent()
	if parent is State:
		(parent as State).begin_state()
	next = ""
	is_active = true
	_begin_state()

func test_state() -> String:
	return ""

func end_state() -> void:
	_end_state()
	is_active = false
	var parent := get_parent()
	if parent is State:
		(parent as State).end_state()

func _begin_state() -> void:
	pass

func _end_state() -> void:
	pass
