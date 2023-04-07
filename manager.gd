extends Node


func dir_contents(path: String, contents: PackedStringArray = PackedStringArray()) -> PackedStringArray:
	var dir := DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				dir_contents(path.path_join(file_name), contents)
			else:
				contents.push_back(path.path_join(file_name))
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path: %s" % path)

	return contents

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for benchmark in dir_contents("res://benchmarks/"):
		do_benchmark(load(benchmark).new())
	
	push_error("done")
	
	await get_tree().process_frame
	
	get_tree().quit()

var version = Engine.get_version_info()["hash"]
var do_complexity = false

func do_benchmark(benchmark : Benchmark):
	push_error(benchmark.get_name())
	if do_complexity:
		for n in range(10):
			benchmark.count = (n + 1) * benchmark.count_base()
			do_benchmark_core(benchmark)
	else:
		benchmark.count = 10 * benchmark.count_base()
		do_benchmark_core(benchmark)

func do_benchmark_core(benchmark : Benchmark):
	benchmark._setup()
	var start = Time.get_ticks_msec()
	var mems = OS.get_static_memory_usage()
	benchmark._execute()
	var end = Time.get_ticks_msec()
	var meme = OS.get_static_memory_usage()
	benchmark._teardown()
	print("%s\t%s\t%d\t%d\t%d" % [version, benchmark.get_name(), benchmark.count, end - start, meme - mems])
