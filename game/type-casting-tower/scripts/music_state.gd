extends Node

var music: int = 0.0
var volume: int = 50

func _ready() -> void:
	var bus_index := AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(volume))
