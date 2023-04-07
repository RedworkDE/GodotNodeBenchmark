extends Benchmark

var root : Node
var first : Node
var children : Array[Node]

func _setup():
	root = Node.new()
	first = Node.new()
	root.add_child(first)
	children = []
	for n in count:
		children.push_back(Node.new())

func _execute():
	for n in count:
		var parent = first.get_parent()
		var child = children[n]
		parent.add_child(child)
		parent.move_child(child, first.get_index() + 1)

func _teardown():
	root.free()
	children = []
