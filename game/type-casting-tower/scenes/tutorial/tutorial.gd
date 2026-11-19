extends Control

@export_file("*.tscn") var menu_scene: String = "res://scenes/main_menu.tscn"

@onready var panel: PanelContainer = $PanelContainer
@onready var text: RichTextLabel = $PanelContainer/MarginContainer/Text
@onready var return_button: Button = $ReturnButton


const TUTORIAL_TEXT := """[font_size=32]OVERVIEW[/font_size]
In Type Casting Tower, you are a wizard defending a tower from approaching enemies. Each enemy has a word on its head. Type the word and press Enter to cast a spell and defeat it.

[font_size=32]GETTING STARTED[/font_size]
Click Play on the main menu. Enemies spawn at the edge of the forest on the right and walk toward your tower on the left. Type the word shown on an enemy to target it, then press Enter to submit.

[font_size=32]TYPING[/font_size]
Every letter you type is accepted, including mistakes. Use Backspace to fix errors before you press Enter. Letters turn a different color as you type so you can see how you are doing. A wrong submission resets your streak.

[font_size=32]TOWER[/font_size]
When an enemy reaches the tower it attacks and removes 1 HP. The tower changes appearance as it takes damage. When HP reaches zero the game is over.

[font_size=32]WAVES AND BOSSES[/font_size]
Enemies arrive in waves, and each wave moves faster than the last. Boss enemies have a health bar made of several words, so you must submit every word to defeat one.

[font_size=32]SHOP[/font_size]
You earn in-game currency for each enemy you defeat, paid out at the end of each wave. Spend it in the shop on cosmetics. Currency is earned by beating monsters.

[font_size=32]CONTROLS[/font_size]
Keyboard: type words, Enter to submit, Backspace to delete, Escape to pause.
Mouse: navigate menus.
"""

func _ready() -> void:

	text.text = TUTORIAL_TEXT
