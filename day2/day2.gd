extends MainLoop

func _initialize():
	part_one()
	part_two()

func part_one():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")

	var red_limit: int = 12
	var grn_limit: int = 13
	var blu_limit: int = 14

	var result: int = 0

	for line in contents:
		var possible: bool
		var red_maximum = 0
		var grn_maximum = 0
		var blu_maximum = 0

		var id: int = int(line.split(":")[0].split(" ")[1])
		var sets: PackedStringArray = line.split(": ")[1].split("; ")
		for cur_set in sets:
			var cubes = cur_set.split(", ")
			for cube in cubes:
				var amt = int(cube.split(" ")[0])
				match cube.split(" ")[1]:
					"red":
						if amt > red_maximum:
							red_maximum = amt
					"green":
						if amt > grn_maximum:
							grn_maximum = amt
					"blue":
						if amt > blu_maximum:
							blu_maximum = amt

		possible = (red_maximum <= red_limit and grn_maximum <= grn_limit and blu_maximum <= blu_limit)
		if possible:
			result += id

	print(result)

func part_two():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")

	var result: int = 0

	for line in contents:
		var power: int
		var red_maximum = 0
		var grn_maximum = 0
		var blu_maximum = 0

		var sets: PackedStringArray = line.split(": ")[1].split("; ")
		for cur_set in sets:
			var cubes = cur_set.split(", ")
			for cube in cubes:
				var amt = int(cube.split(" ")[0])
				match cube.split(" ")[1]:
					"red":
						if amt > red_maximum:
							red_maximum = amt
					"green":
						if amt > grn_maximum:
							grn_maximum = amt
					"blue":
						if amt > blu_maximum:
							blu_maximum = amt
		power = red_maximum * blu_maximum * grn_maximum
		result += power

	print(result)

func _process(_delta):
	return 1
