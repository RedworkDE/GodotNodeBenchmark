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
	seed(123456)
	children.shuffle()

func _execute():
	for n in count:
		root.remove_child(children[n])

func _teardown():
	root.free()
	for n in count:
		children[n].free()
	children = []
