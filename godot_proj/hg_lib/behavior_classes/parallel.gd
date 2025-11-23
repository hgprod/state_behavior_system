class_name BehaviorParallel extends BehaviorGroup

var _max_succeed: int
var _max_fail: int

func _init(children: Array[Behavior], max_succeed: int = 0, max_fail: int = 0):
	super._init(children)
	_max_succeed = max_succeed
	_max_fail = max_fail

func _tick() -> Result:
	var succeed_count: int = 0
	var fail_count: int = 0
	var is_running: bool = false
	for child in _children:
		var result := child.tick()
		if result == Result.RUNNING: is_running = true
		elif result == Result.SUCCEED and _max_succeed != 0:
			succeed_count += 1
			if succeed_count >= _max_succeed: return Result.SUCCEED
		elif result == Result.FAIL and _max_fail != 0:
			fail_count += 1
			if fail_count >= _max_fail: return Result.FAIL
	return Result.RUNNING if is_running else Result.SUCCEED
