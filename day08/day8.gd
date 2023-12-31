extends MainLoop

func _initialize():
	part_one()
	part_two()

func lcm(x: int, y: int):
	var mcd: int = -1
	for i in range(min(x, y), 0, -1):
		if x % i == 0 and y % i == 0:
			mcd = i
			break
	return (x * y) / mcd

func part_one():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = Array(file.get_as_text(true).trim_suffix("\n").split("\n"))
	var network: Dictionary = {}
	var cursor = "AAA"
	var steps = 0

	var path = contents.pop_front()
	contents.pop_front()
	for line in contents:
		var spl = line.split(" ")
		network[spl[0]] = line.substr(7, 8).split(", ")

	while cursor != "ZZZ":
		for dir in path:
			match dir:
				"L": cursor = network[cursor][0]
				"R": cursor = network[cursor][1]
			steps += 1

	print(steps)

func part_two():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = Array(file.get_as_text(true).trim_suffix("\n").split("\n"))
	var network: Dictionary = {}
	var cursors = []
	var steps = []
	var done = 0

	var path = contents.pop_front()
	contents.pop_front()
	for line in contents:
		var spl = line.split(" ")
		network[spl[0]] = line.substr(7, 8).split(", ")
		if spl[0][2] == "A":
			cursors.append(spl[0])
			steps.append(0)

	while true:
		for dir in path:
			for i in range(len(cursors)):
				if cursors[i][2] != "Z":
					match dir:
						"L": cursors[i] = network[cursors[i]][0]
						"R": cursors[i] = network[cursors[i]][1]
					steps[i] += 1
					done = 0
				else:
					done += 1
				if done == len(cursors): break
			if done == len(cursors): break
		if done == len(cursors): break

	var result = steps.reduce(func(a,v): return lcm(a, v))
	print(result)


func _process(_delta):
	return 1
