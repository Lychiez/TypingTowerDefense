extends HSlider

@export var bus_name: String = "Master"
var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	var current_db := AudioServer.get_bus_volume_db(bus_index)
	value = db_to_linear(current_db)
	value_changed.connect(_on_value_changed)

func _on_value_changed(new_value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(new_value))
