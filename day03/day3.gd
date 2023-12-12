extends MainLoop

func _initialize():
	part_one()
	part_two()

func part_one():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")

	var numbers: Array = []
	var result: int = 0

	for y in range(len(contents)):
		var current_number = ""
		for x in range(len(contents[y])):
			if contents[y][x] in "0123456789":
				current_number += contents[y][x]
			if contents[y][x] not in "0123456789" or x == len(contents[y]) - 1:
				if current_number != "":
					numbers.append({
							"number": int(current_number),
							"line": y,
							"column_start": x - len(current_number),
							"column_end": x - 1,
							"is_part_number": false,
						})
					current_number = ""
	
	for y in range(len(contents)):
		for x in range(len(contents[y])):
			if contents[y][x] not in "0123456789.":
				for number in numbers:
					if y in range(number["line"] - 1, number["line"] + 2):
						if x in range(number["column_start"] - 1, number["column_end"] + 2):
							number["is_part_number"] = true

	for number in numbers:
		if number["is_part_number"]:
			result += number["number"]

	print(result)

func part_two():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")

	var numbers: Array = []
	var result: int = 0

	for y in range(len(contents)):
		var current_number = ""
		for x in range(len(contents[y])):
			if contents[y][x] in "0123456789":
				current_number += contents[y][x]
			if contents[y][x] not in "0123456789" or x == len(contents[y]) - 1:
				if current_number != "":
					numbers.append({
							"number": int(current_number),
							"line": y,
							"column_start": x - len(current_number),
							"column_end": x - 1,
						})
					current_number = ""
	
	for y in range(len(contents)):
		for x in range(len(contents[y])):
			if contents[y][x] == "*":
				var neighbors: = []
				for number in numbers:
					if y in range(number["line"] - 1, number["line"] + 2):
						if x in range(number["column_start"] - 1, number["column_end"] + 2):
							neighbors.append(number["number"])
				if len(neighbors) == 2:
					result += neighbors[0] * neighbors[1]

	print(result)

func _process(_delta):
	return 1
