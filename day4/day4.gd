extends MainLoop

func _initialize():
	part_one()
	part_two()

func part_one():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")

	var result: int = 0

	for line in contents:
		var prize_nums: Array = Array(line.split(": ")[1].split(" | ")[0].split(" ")).filter(func(a): return a != "")
		var card_nums: Array = Array(line.split(": ")[1].split(" | ")[1].split(" ")).filter(func(a): return a != "")

		var score: int = 0

		for num in card_nums:
			if num in prize_nums:
				score = score * 2 if score > 0 else 1

		result += score

	print(result)

func part_two():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = Array(file.get_as_text(true).trim_suffix("\n").split("\n"))
	var cards: int = 0
	var cache: Dictionary = {}
	var card_db: Dictionary = {}

	for line in contents:
		var card_id: String = line.split(":")[0].trim_prefix("Card ").strip_edges()
		var prize_nums: Array = Array(line.split(": ")[1].split(" | ")[0].split(" ")).filter(func(a): return a != "")
		var card_nums:  Array = Array(line.split(": ")[1].split(" | ")[1].split(" ")).filter(func(a): return a != "")
		var copies: int = 0

		for num in card_nums:
			if num in prize_nums:
				copies += 1

		cache[card_id] = copies
		card_db[card_id] = 1

	for line in contents:
		var card_id: String = line.split(":")[0].trim_prefix("Card ").strip_edges()
		var cards_to_copy: Array = range(int(card_id) + 1, int(card_id) + cache[card_id] + 1)

		for card in cards_to_copy:
			card_db[str(card)] += card_db[card_id]

	for card in card_db:
		cards += card_db[card]
	print(cards)

func _process(_delta):
	return 1
