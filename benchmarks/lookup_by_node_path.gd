extends Benchmark

var root : Node
var children : Array[Node]
var names : Array[NodePath]

func _setup():
	root = Node.new()
	children = []
	names = []
	for n in count:
		var node = Node.new()
		var name = StringName(str("n", n))
		node.name = name
		children.push_back(node)
		names.push_back(NodePath(name))
	for n in count:
		root.add_child(children[n])

func _execute():
	for n in count:
		root.get_node(names[n])

func _teardown():
	root.free()
	children = []
