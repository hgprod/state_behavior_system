@abstract class_name Behavior extends RefCounted

enum Result { FAIL, SUCCEED, RUNNING }

var _context: Dictionary[String, Variant]

func tick() -> Result:
	return _tick()

func build() -> Behavior:
	_propogate_context(_context)
	return self

func get_value(ctx_name: String) -> Variant:
	return _context.get(ctx_name)

func set_value(ctx_name: String, val: Variant) -> Behavior:
	_context[ctx_name] = val
	return self

func _propogate_context(master_context: Dictionary[String, Variant]):
	if _context != master_context:
		master_context.merge(_context)
	_context = master_context

@abstract func _tick() -> Result
