extends Control
@onready var play_button: Button = %PlayButton
@onready var shop_button: Button = %ShopButton
@onready var tutorial_button: Button = %TutorialButton
@onready var options_button: Button = %OptionsButton
@onready var exit_button: Button = %ExitButton
@onready var high_score_button: Button = %HighScoreButton


func _ready() -> void:
	play_button.pressed.connect(_on_play_pressed)
	shop_button.pressed.connect(_on_shop_pressed)
	tutorial_button.pressed.connect(_on_tutorial_pressed)
	options_button.pressed.connect(_on_options_pressed)
	high_score_button.pressed.connect(_on_high_score_pressed)
	exit_button.pressed.connect(_on_exit_pressed)
	play_button.grab_focus()

func _on_play_pressed() -> void:
	print("Game not built yet")
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")

func _on_shop_pressed() -> void:
	print("Shop not built yet")
	get_tree().change_scene_to_file("res://scenes/shop/shop.tscn")


func _on_tutorial_pressed() -> void:
	print("Tutorial not built yet")
	get_tree().change_scene_to_file("res://scenes/tutorial/tutorial.tscn")

func _on_options_pressed() -> void:
	print("Options not built yet")
	get_tree().change_scene_to_file("res://scenes/options/options.tscn")

func _on_high_score_pressed() -> void:
	print ("High Score not built yet")
	get_tree().change_scene_to_file("res://scenes/highscore/high_score.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
	
	
