extends Benchmark

var root : Node
var children : Array[Node]

func _setup():
	root = Node.new()
	children = []
	for n in count:
		children.push_back(Node.new())

func _execute():
	for n in count:
		var child = children[n]
		root.add_child(child)
		root.move_child(child, 0)

func _teardown():
	root.free()
	children = []
