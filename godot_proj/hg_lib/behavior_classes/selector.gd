class_name BehaviorSelector extends BehaviorGroup

func _tick() -> Result:
	for node in _children:
		var result := node.tick()
		if result != Result.FAIL: return result
	return Result.SUCCEED
