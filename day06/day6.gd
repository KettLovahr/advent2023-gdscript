extends MainLoop

func _initialize():
	part_one()
	part_two()

func part_one():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")
	
	var times = Array(contents[0].trim_prefix("Time: ").split(" ")).filter(func(a): return a != "").map(func(a): return int(a))
	var distances = Array(contents[1].trim_prefix("Distance: ").split(" ")).filter(func(a): return a != "").map(func(a): return int(a))
	var winstrats := []

	for i in range(len(times)):
		var ways_to_win := 0
		for j in range(times[i]):
			var dist = (times[i] - j) * j
			if dist > distances[i]:
				ways_to_win += 1
		winstrats.append(ways_to_win)


	var result = winstrats.reduce(func(accum, item): return accum * item)
	print(result)

func part_two():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")
	
	var time = int(contents[0].trim_prefix("Time: ").replace(" ", ""))
	var distance = int(contents[1].trim_prefix("Distance: ").replace(" ", ""))
	var result: int

	var ways_to_win := 0
	for j in range(time):
		var dist = (time - j) * j
		if dist > distance:
			result += 1

	print(result)

func _process(_delta):
	return 1
