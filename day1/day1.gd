extends MainLoop

func _initialize():
	part_one()
	part_two()

func part_two():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).split("\n")
	var numbers = {
		"one": 1,
		"two": 2,
		"three": 3,
		"four": 4,
		"five": 5,
		"six": 6,
		"seven": 7,
		"eight": 8,
		"nine": 9,
	}

	var values: Array = []

	for line in contents:
		if line == "":
			break
		var first_num: int = -1
		var last_num: int = -1
		for i in range(len(line)):
			if line[i] in "0123456789":
				if first_num == -1:
					first_num = int(line[i])
				last_num = int(line[i])
			else:
				for num in numbers:
					if line.substr(i, len(num)) == num:
						if first_num == -1:
							first_num = numbers[num]
						last_num = numbers[num]

		var res = first_num * 10 + last_num
		values.append(res)

	var result = 0
	for value in values:
		result += value
	print(result)

func part_one():
	var file = FileAccess.open("input", FileAccess.READ)
	var contents = file.get_as_text(true).split("\n")

	var values: Array = []

	for line in contents:
		if line == "":
			break
		var first_num: int = -1
		var last_num: int = -1
		for character in line:
			if character in "0123456789":
				if first_num == -1:
					first_num = int(character)
				last_num = int(character)
		var res = first_num * 10 + last_num
		values.append(res)

	var result = 0
	for value in values:
		result += value
	print(result)
	

func _process(_delta):
	return 1
