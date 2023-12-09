extends MainLoop

func _initialize():
	part_one()
	part_two()

func part_one():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")

	var result:= 0

	for line in contents:
		var xtrp: Array = []
		xtrp.append(Array(line.split(" ")).map(func(a): return int(a)))
		while not xtrp[-1].reduce(func(a, n): return a and n == 0, true):
			var current := []
			for i in range(len(xtrp[-1]) - 1):
				current.append(xtrp[-1][i+1] - xtrp[-1][i])
			xtrp.append(current)
		var extrapolation = xtrp.reduce(func(a, n): return a + n[-1], 0)
		result += extrapolation

	print(result)

func part_two():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")

	var result:= 0

	for line in contents:
		var xtrp: Array = []
		xtrp.append(Array(line.split(" ")).map(func(a): return int(a)))
		while not xtrp[-1].reduce(func(a, n): return a and n == 0, true):
			var current := []
			for i in range(len(xtrp[-1]) - 1):
				current.append(xtrp[-1][i] - xtrp[-1][i+1])
			xtrp.append(current)
		var extrapolation = xtrp.reduce(func(a, n): return a + n[0], 0)
		result += extrapolation

	print(result)

func _process(_delta):
	return 1
