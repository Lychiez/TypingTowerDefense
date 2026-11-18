extends Control

@onready var scores_box: VBoxContainer = $MarginContainer/VBoxContainer/Scores

@export_file("*.tscn") var menu_scene: String

func _ready() -> void:
	display_scores()
	
func display_scores() -> void:
	for child in scores_box.get_children():
		scores_box.remove_child(child)
		child.queue_free()

	var scores: Array = ScoreManager.load_scores()
	scores_box.add_theme_constant_override("separation", 8)

	if scores.is_empty():
		var message := Label.new()
		message.add_theme_font_size_override("font_size", 32)
		message.text = "No completed sessions yet."
		scores_box.add_child(message)
		return

	for i in range(mini(scores.size(), 10)):
		var box := PanelContainer.new()

		var style := StyleBoxFlat.new()
		style.bg_color = Color("#283347")
		style.set_corner_radius_all(8)
		style.content_margin_left = 16
		style.content_margin_right = 16
		style.content_margin_top = 10
		style.content_margin_bottom = 10
		box.add_theme_stylebox_override("panel", style)

		var label := Label.new()
		label.add_theme_font_size_override("font_size", 32)
		label.text = "%d. Streak: %d" % [i + 1, int(scores[i])]
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

		box.add_child(label)
		scores_box.add_child(box)
