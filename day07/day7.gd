extends MainLoop

enum Hands {
	HIGHCARD,
	ONEPAIR,
	TWOPAIR,
	THREEKIND,
	FULLHOUSE,
	FOURKIND,
	FLUSH
}

func _initialize():
	part_one()
	part_two()

func get_type(hand, joker = false) -> int:
	var hand_info: Dictionary = {}
	for card in hand:
		if card not in hand_info:
			hand_info[card] = 1
		else:
			hand_info[card] += 1
	var structure = []
	if joker and "J" in hand_info:
		for card in hand_info:
			if card != "J":
				structure.append(hand_info[card])
	else:
		for card in hand_info:
			structure.append(hand_info[card])
	structure.sort()
	structure.reverse()
	if joker:
		for card in hand_info:
			if len(structure) > 0:
				if card == "J":
					structure[0] += hand_info["J"]
			else:
				structure = [5]
	match structure:
		[5]: return Hands.FLUSH
		[4, 1]: return Hands.FOURKIND
		[3, 2]: return Hands.FULLHOUSE
		[3, 1, 1]: return Hands.THREEKIND
		[2, 2, 1]: return Hands.TWOPAIR
		[2, 1, 1, 1]: return Hands.ONEPAIR
		[1, 1, 1, 1, 1]: return Hands.HIGHCARD
	return -1

func part_one():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")
	var strengths = "23456789TJQKA"

	var conv_cont = Array(contents)

	conv_cont.sort_custom(
		func(a, b):
			var a_score = get_type(a.split(" ")[0])
			var b_score = get_type(b.split(" ")[0])
			if a_score != b_score:
				return a_score > b_score
			else:
				for i in range(len(a)):
					var a_strength = strengths.find(a[i])
					var b_strength = strengths.find(b[i])
					if a_strength != b_strength:
						return a_strength > b_strength
	)

	var result = 0
	for i in range(len(conv_cont)):
		result += int(conv_cont[i].split(" ")[1]) * (len(conv_cont) - i)
	print(result)

func part_two():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")
	var strengths = "J23456789TQKA"

	var conv_cont = Array(contents)

	conv_cont.sort_custom(
		func(a, b):
			var a_score = get_type(a.split(" ")[0], true)
			var b_score = get_type(b.split(" ")[0], true)
			if a_score != b_score:
				return a_score > b_score
			else:
				for i in range(len(a)):
					var a_strength = strengths.find(a[i])
					var b_strength = strengths.find(b[i])
					if a_strength != b_strength:
						return a_strength > b_strength
	)

	var result = 0
	for i in range(len(conv_cont)):
		result += int(conv_cont[i].split(" ")[1]) * (len(conv_cont) - i)
	print(result)

func _process(_delta):
	return 1
