extends Control

@onready var music: AudioStreamPlayer = $AudioStreamPlayer
func _ready() -> void:
	music.play(MusicState.shop_music_position)

@onready 	var keysLabel: Label = $keys_label
@onready	var ItemButton: Button = $"MarginContainer2/VBoxContainer/item #1 button"
var boughtItem: bool
var shop_record: ShopRecords = PlayerData.shopRecord

func _process(_delta: float) -> void:
	if music.playing:
		MusicState.shop_music_position = music.get_playback_position()
	keysLabel.text = "Keys: " + str(PlayerData.keys)
	if shop_record.isBought:
		ItemButton.text = "bought!"
		ItemButton.disabled = true

func _on_item_1_button_pressed() -> void:
	if PlayerData.keys >= 2 and not shop_record.isBought:
		PlayerData.keys -= 2
		shop_record.isBought = true
		print("Keys left: ", PlayerData.keys)
