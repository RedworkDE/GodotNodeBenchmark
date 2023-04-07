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
		root.add_child(children[n])
	for n in count:
		root.move_child(children[n], 0)

func _teardown():
	root.free()
	children = []
