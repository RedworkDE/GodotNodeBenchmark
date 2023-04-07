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
		root.add_child(children[n])

func _execute():
	for n in count:
		root.get_child(n)

func _teardown():
	root.free()
	children = []
