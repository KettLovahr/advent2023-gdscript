extends MainLoop

func _initialize():
	part_one()
	part_two()

func part_one():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")
	var seeds: Array = Array(contents[0].trim_prefix("seeds: ").split(" ")).map(func(x): return int(x))
	var just_the_maps: Array = Array(contents).filter(func(x): return x == "" or x[0] in "0123456789")

	for i in range(len(seeds)):
		var category_mapped = false
		for map in just_the_maps:
			if map == "":
				category_mapped = false
			elif not category_mapped:
				var mapnums: Array = Array(map.split(" ")).map(func(x): return int(x))
				if seeds[i] >= mapnums[1] and seeds[i] < mapnums[1] + mapnums [2]:
					var converted = seeds[i] + mapnums[0] - mapnums[1]
					seeds[i] = converted
					category_mapped = true

	print(seeds.min())


func part_two():
	var file = FileAccess.open("./input", FileAccess.READ)
	var contents = file.get_as_text(true).trim_suffix("\n").split("\n")
	var seeds: Array = Array(contents[0].trim_prefix("seeds: ").split(" ")).map(func(x): return int(x))
	var just_the_maps: Array = Array(contents).filter(func(x): return x == "" or x[0] in "0123456789")

	var reference_seed: int

	var current_hash: int = -1
	var previous_hash: int = -1

	var smallest_loc: int = 9223372036854775807
	var lookahead: bool = false

	for i in range(len(seeds)):
		current_hash = -1
		previous_hash = -1
		lookahead = false
		if i%2 == 0:
			reference_seed = seeds[i]
		if i%2 == 1:
			var offset: int = 0
			while offset < seeds[i]:
				var path: Array = []
				previous_hash = current_hash
				var current_seed = reference_seed + offset
				var category_mapped = false
				for map in just_the_maps:
					if map == "":
						category_mapped = false
					elif not category_mapped:
						var mapnums: Array = Array(map.split(" ")).map(func(x): return int(x))
						if current_seed >= mapnums[1] and current_seed < mapnums[1] + mapnums [2]:
							var converted = current_seed + mapnums[0] - mapnums[1]
							current_seed = converted
							category_mapped = true
							path.append(map)
				if current_seed < smallest_loc:
					smallest_loc = current_seed
				current_hash = path.hash()
				if previous_hash == current_hash:
					offset += 1000
					lookahead = true
				else:
					if not lookahead:
						offset += 1
						offset = min(offset, seeds[i])
						lookahead = false
					else:
						offset -= 999
						offset = max(0, offset)
						lookahead = false
	print(smallest_loc)



func _process(_delta):
	return 1
