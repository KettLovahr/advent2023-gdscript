extends MainLoop

func _initialize():
	part_one()
	# part_two()

func part_one():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")

	var directions: Dictionary = {
		"up": Vector2i(0, -1),
		"down": Vector2i(0, 1),
		"left": Vector2i(-1, 0),
		"right": Vector2i(1, 0)
	}

	var connections: Dictionary = {
		"|": [directions.up   , directions.down],
		"-": [directions.left , directions.right],
		"L": [directions.up   , directions.right],
		"F": [directions.right, directions.down],
		"J": [directions.left , directions.up],
		"7": [directions.down , directions.left],
		"S": [],
		".": [],
	}

	var initial := Vector2i.ZERO
	var cursor := Vector2i.ZERO
	var prev := Vector2i.ZERO

	for y in range(len(contents)):
		for x in range(len(contents[y])):
			if contents[y][x] == "S":
				initial = Vector2i(x, y)
				cursor = Vector2i(x, y)
				prev = Vector2i(x, y)
				break

	# Find the first pipe that connects back to this one
	for y in range(cursor.y - 1, cursor.y + 2):
		for x in range(cursor.x - 1, cursor.x + 2):
			var conn = contents[y][x]
			for dir in connections[conn]:
				if (Vector2i(x, y) + dir) == cursor:
					cursor = Vector2i(x, y)

	var steps := 0

	while cursor != initial:
		var conn = contents[cursor.y][cursor.x]
		for dir in connections[conn]:
			if cursor + dir != prev:
				prev = cursor
				cursor += dir
				steps += 1
				break
	steps = steps / 2 + 1
	print(steps)



func part_two():
	var file = FileAccess.open("./sample", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")

func _process(_delta):
	return 1
