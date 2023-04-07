extends Benchmark

var root : Node
var children : Array[Node]

func count_base() -> int:
	return 10000

func _setup():
	root = Node.new()
	children = []
	for n in count:
		children.push_back(Node.new())
	for n in count:
		root.add_child(children[count - n - 1])

func _execute():
	for n in count:
		root.remove_child(children[n])

func _teardown():
	root.free()
	for n in count:
		children[n].free()
	children = []
