extends MainLoop

func _initialize():
	part_one()
	part_two()

func part_one():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")
	var result = 0

	var galaxy_coords: Array = []
	var empty_rows: Array = []
	var empty_cols: Array = []
	empty_rows.resize(len(contents))
	empty_cols.resize(len(contents[0]))
	empty_rows.fill(true)
	empty_cols.fill(true)

	for y in range(len(contents)):
		for x in range(len(contents[y])):
			if contents[y][x] == "#":
				galaxy_coords.append(Vector2i(x,y))
				empty_rows[y] = false
				empty_cols[x] = false

	while len(galaxy_coords) > 0:
		var src = galaxy_coords.pop_back()
		for dst in galaxy_coords:
			var mx = range(min(src.x, dst.x) + 1, max(src.x, dst.x) + 1).reduce(func(a, n): return a + (2 if empty_cols[n] else 1), 0)
			var my = range(min(src.y, dst.y) + 1, max(src.y, dst.y) + 1).reduce(func(a, n): return a + (2 if empty_rows[n] else 1), 0)
			result += mx + my

	print(result)



func part_two():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")
	var result = 0

	var galaxy_coords: Array = []
	var empty_rows: Array = []
	var empty_cols: Array = []
	empty_rows.resize(len(contents))
	empty_cols.resize(len(contents[0]))
	empty_rows.fill(true)
	empty_cols.fill(true)

	for y in range(len(contents)):
		for x in range(len(contents[y])):
			if contents[y][x] == "#":
				galaxy_coords.append(Vector2i(x,y))
				empty_rows[y] = false
				empty_cols[x] = false

	while len(galaxy_coords) > 0:
		var src = galaxy_coords.pop_back()
		for dst in galaxy_coords:
			var mx = range(min(src.x, dst.x) + 1, max(src.x, dst.x) + 1).reduce(func(a, n): return a + (1000000 if empty_cols[n] else 1), 0)
			var my = range(min(src.y, dst.y) + 1, max(src.y, dst.y) + 1).reduce(func(a, n): return a + (1000000 if empty_rows[n] else 1), 0)
			result += mx + my

	print(result)

func _process(_delta):
	return 1
