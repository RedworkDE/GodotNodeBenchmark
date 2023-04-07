class_name Benchmark

var count : int
func count_base() -> int:
	return 1000

func _setup():
	pass

func _execute():
	pass

func _teardown():
	pass

func get_name() -> String:
	return (get_script() as Script).resource_path.get_file().get_slice(".", 0)
