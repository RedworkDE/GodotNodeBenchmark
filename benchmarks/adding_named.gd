extends Benchmark

var root : Node
var children : Array[Node]

func count_base() -> int:
	return 10000

func _setup():
	root = Node.new()
	children = []
	for n in count:
		var node = Node.new()
		node.name = str("n", n)
		children.push_back(node)

func _execute():
	for n in count:
		root.add_child(children[n])

func _teardown():
	root.free()
	children = []
