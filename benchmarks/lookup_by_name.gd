extends Benchmark

var root : Node
var children : Array[Node]

func _setup():
	root = Node.new()
	children = []
	for n in count:
		children.push_back(Node.new())
	for n in count:
		root.add_child(children[n])

func _execute():
	for n in count:
		root.find_child(children[n].name)

func _teardown():
	root.free()
	children = []
