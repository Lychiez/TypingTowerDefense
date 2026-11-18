extends VBoxContainer

@export var bus_name: String = "Master"

@onready var slider: HSlider = $HSlider
@onready var value: Label = $HBoxContainer/Value

var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	var current_db := AudioServer.get_bus_volume_db(bus_index)
	
	slider.value = db_to_linear(current_db)
	_update_display(slider.value)
	
	slider.value_changed.connect(_on_value_changed)

func _on_value_changed(new_value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(new_value))
	_update_display(new_value)

func _update_display(val: float) -> void:
	var volume_int: int = int(val)
	value.text = str(volume_int) + "%"
