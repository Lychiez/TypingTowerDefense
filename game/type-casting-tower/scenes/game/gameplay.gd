extends Node
@export var tower: Node
@export var enemy: Node
@export var player: Node
@onready var textBox: RichTextLabel = $Textbox
@onready var streakBox: Label = $Streak
@onready var gameOverBox: VBoxContainer = $"Game Over Box"

# The player needs to be able to type
# enemy needs to exist and move
# By keeping track of enemy location, tower texture region change
# Called when the node enters the scene tree for the first time.
# moved to the collision handling by the collision shapes
var session_ended := false
var streak = 0
var session_saved := false

func _ready() -> void:
	player.streak_changed.connect(streak_change)
	tower.destroyed.connect(end_session)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#func update_word_display() ->void:
	#if target_word.is_empty():
		#target_word = WordClass.wordsList.pick_random()
	#textBox.clear()
	#for i in range(target_word.length()):
		#var letter_color := Color.BLACK
		#if i < typed_word.length():
			#if typed_word[i] == target_word[i]:
				#letter_color = Color.GREEN
			#else:
				#letter_color = Color.RED
		#textBox.push_color(letter_color)
		#textBox.add_text(target_word[i])
		#textBox.pop()
	#textBox.add_text("\n" + typed_word)
	
#keyboard input of typing, only want letters
#add to the type_word or remove, or send tp submit to comparision handling
#func _unhandled_key_input(event: InputEvent) -> void:
	#if session_ended:
		#return
	#if not event is InputEventKey: 
		#return
	#if not event.pressed or event.echo:
		#return
	#if event.keycode == KEY_ENTER:
		#print("entered pressed")
		#if not typed_word.is_empty():
			#_submit_word()
	#elif event.keycode == KEY_BACKSPACE:
			#print("backspace pressed")
			#typed_word = typed_word.left(-1)
	#elif (event.unicode >= 65 and event.unicode <= 90) or \
		#(event.unicode >= 97 and event.unicode <= 122):
		#print("pressed " + String.chr(event.unicode))
		#typed_word += String.chr(event.unicode)
	#else:
		#return
	#update_word_display()
	#get_viewport().set_input_as_handled()

#handle comparison and consequences
#func _submit_word() -> void:
	#if not (typed_word == target_word):
		#print("word wan't correct, reset streak")
		#streak = 0 
	#else:
		##enemy.take_damage(1)
		#streak += 1
	#typed_word = ""	
	#target_word = ""
	##index = (index + 1) % dictionary.size()
	#streakBox.text = "Streak: " + str(streak)
	#return 

func streak_change(new_streak: int) -> void:
	streakBox.text = "Streak: " + str(new_streak)

# a game session ends
#tower for game ending reasons
func end_session() -> void:
	if session_saved:
		return
	#var error := ScoreManager.save_score(streak)
	#if error == OK:
		#session_saved = true
