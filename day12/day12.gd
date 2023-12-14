extends MainLoop

func _initialize():
	part_one()
	# part_two()

func part_one():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")
	var rows := Array(contents).map(
		func (a):
			return [
				a.split(" ")[0],
				Array(a.split(" ")[1].split(",")).map( func (b): return int(b)) ]
			)

	var result := 0

	for row in rows:
		var unknowns = 0
		for ch in row[0]:
			if ch == "?":
				unknowns += 1
		for i in range(2 ** unknowns):
			var matches = 0
			var current = ""
			for c in row[0]:
				if c == "?":
					current += "." if (i >> matches) % 2 == 0 else "#"
					matches += 1
				else: 
					current += c
			var arr := [0]
			for bath in current:
				if bath == "#":
					arr[-1] += 1
				else:
					arr.append(0)
			arr = arr.filter(func (a): return a != 0)
			if arr == row[1]:
				result += 1

	print(result)

func part_two():
	var file = FileAccess.open("./sample", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")

func _process(_delta):
	return 1
