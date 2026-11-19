extends Control

@onready var music: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	music.play(MusicState.music)
