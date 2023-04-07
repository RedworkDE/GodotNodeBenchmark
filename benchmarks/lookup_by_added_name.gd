extends Benchmark

var root : Node
var children : Array[Node]
var names : Array[StringName]

func _setup():
	root = Node.new()
	children = []
	names = []
	for n in count:
		var node = Node.new()
		var name = StringName(str("n", n))
		node.name = name
		children.push_back(node)
		names.push_back(name)
	for n in count:
		root.add_child(children[n])

func _execute():
	for n in count:
		root.find_child(names[n])

func _teardown():
	root.free()
	children = []
