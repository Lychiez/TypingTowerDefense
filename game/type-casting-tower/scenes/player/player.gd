class_name Player
extends Node

signal streak_changed(new_streak)
@export var health = 100
@export var input: String = ""
@export var keys: int = 10
@export var score: int = 0

# Will likely be used for increasing score multiplicatively?
# Also can be used to measure typing accuracy
var streak = 0
var currEnemy: Enemy = null

# Handles keyboard input
func _unhandled_input(event: InputEvent) -> void:
	var typedChar = ''
	# Handling for keyboard input
	if event is InputEventKey and event.pressed:
		# Handler for keyboard backspace
		if event.keycode == KEY_BACKSPACE:
			print("backspace pressed")
			if not input.is_empty():
				input = input.left(-1)
				currEnemy.checkAcc(input)
			else:
				currEnemy = null
			return
		# Handler for keyboard enter
		elif event.keycode == KEY_ENTER:
			if input == currEnemy.currWord:
				print("Word is correct!")
				deal_damage(currEnemy)
				streak += 1
				streak_changed.emit(streak)
			else:
				print("word wan't correct, reset streak")
				streak = 0
				streak_changed.emit(streak)
			# Standard keyboard games have enter always reset input.
			input = ""
			currEnemy.checkAcc(input)
			return
		# use event.unicode to make keyboard layout malleable.
		# Could also use event.keycode but would mean you'd
		# have to add extra code for different keyboard layouts.
		typedChar = char(event.unicode)
		if currEnemy == null:
			grab_enemy(typedChar)
		input += typedChar
		print("Pressed ", typedChar)
		# For Color Coding the Word as you type.
		if currEnemy != null:
			currEnemy.checkAcc(input)
		get_viewport().set_input_as_handled()

# Used to grab enemy for dedicated input
# When typing a word should only be able to type that one word
# Unless you backspace fully and input becomes "" again.
func grab_enemy(currentChar: String) -> void:
	var enemies = get_tree().get_nodes_in_group("enemies")
	for node in enemies:
		# cast node as enemy type
		var enemy = node as Enemy
		if enemy and enemy.currWord.begins_with(currentChar):
			currEnemy = enemy

func deal_damage(currEnemy: Enemy) -> void:
	if (currEnemy.health > 0):
		currEnemy.health -= 50
		currEnemy.currWord = WordClass.wordsList.pick_random()
	if currEnemy.health == 0:
		print("Enemy defeated")
		currEnemy.destroy()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
