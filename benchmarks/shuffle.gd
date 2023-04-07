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
	seed(123456)
	for n in count:
		root.move_child(children[randi_range(0, count - 1)], randi_range(0, count - 1))

func _teardown():
	root.free()
	children = []
