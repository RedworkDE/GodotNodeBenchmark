extends Benchmark

var root : Node
var first : Node
var children : Array[Node]

func count_base() -> int:
	return 10000

func _setup():
	root = Node.new()
	first = Node.new()
	root.add_child(first)
	children = []
	for n in count:
		children.push_back(Node.new())
	for n in count:
		root.add_child(children[n])

func _execute():
	for n in count:
		children[n].get_index()

func _teardown():
	root.free()
	children = []
