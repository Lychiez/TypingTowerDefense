extends Node

# min_length and max_length would likely be set by level to generate
# random words for enemies to add difficulty for learning
@export var min_length: int = 0
@export var max_length: int = 0

# Dictionary type is basically godots version of hashmap
# Since wordsList is unique and holds 
var wordsList: Array[String] = []	
var usedWords: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file = FileAccess.open("res://scenes/Wordlist/words_alpha.txt", FileAccess.READ)
	# Check if the file is open
	if file.is_open() != true:
			push_error("Failed to open word file!")
			return
	while not file.eof_reached():
		# add words to wordsList, strip_edges() removes tabulars, ie. spaces, tabs, etc.
		var word = file.get_line().strip_edges()
		wordsList.append(word)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
