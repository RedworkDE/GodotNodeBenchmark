extends Benchmark

var children : Array[Node]

func count_base() -> int:
	return 10000

func _setup():
	children = []
	children.resize(count)

func _execute():
	for n in count:
		children[n] = Node.new()

func _teardown():
	for n in count:
		children[n].free()
	children = []
