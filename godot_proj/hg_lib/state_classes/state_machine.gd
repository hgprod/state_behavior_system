@icon("res://hg_lib/icons/state_machine.svg")
class_name StateMachine extends Node

@export var default: String

var _current: State
var _map := {} as Dictionary[String, State]

func _ready() -> void:
	_map_states()

func _process(_delta: float) -> void:
	if not is_instance_valid(_current):
		_change_state(default)
	elif _current.next != "":
		_change_state(_current.next)
		return
	else:
		for child in _current.get_children():
			if child is StateEvent:
				var event := child as StateEvent
				var next := event.true_state if event.test_event() else event.false_state
				if next != "":
					_change_state(next)
					return

func _change_state(next: String):
	if is_instance_valid(_current):
		_current.end_state()
	_current = _map.get(next)
	if not is_instance_valid(_current):
		push_error("State %s not found" % next)
		return
	_current.begin_state()

func _map_states(node: Node = self):
	for child in node.get_children():
		if child is State:
			_map[child.name] = child as State
			_map_states(child)
