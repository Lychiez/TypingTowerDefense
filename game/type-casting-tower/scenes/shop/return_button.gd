extends Button

@onready var music: AudioStreamPlayer = %AudioStreamPlayer

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	MusicState.shop_position = music.get_playback_position()
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
