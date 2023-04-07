extends Benchmark

var root : Node
var children : Array[Node]

func _setup():
	root = Node.new()
	root.add_child(Node.new())
	children = []
	for n in count:
		children.push_back(Node.new())

func _execute():
	for n in count:
		var child = children[n]
		root.add_child(child)
		root.move_child(child, 1)

func _teardown():
	root.free()
	children = []
