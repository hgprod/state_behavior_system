@abstract class_name BehaviorGroup extends Behavior

var _children: Array[Behavior]

func _init(children: Array[Behavior]):
	_children = children

func _propogate_context(master_context: Dictionary[String, Variant]):
	for child in _children:
		child._propogate_context(master_context)
