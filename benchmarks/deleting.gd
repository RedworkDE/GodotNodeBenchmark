extends Benchmark

var root : Node

func count_base() -> int:
	return 10000

func _setup():
	root = Node.new()
	for n in count:
		root.add_child(Node.new())

func _execute():
	root.free()

func _teardown():
	pass
