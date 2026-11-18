extends Sprite2D
signal destroyed

var health = 3 
@export var three_lives:= Rect2(134, 2, 345, 867)
@export var two_lives:= Rect2(507, 5, 345, 867)
@export var one_lives:= Rect2(887, 31, 345, 867)
@export var no_lives:= Rect2(1274, 42, 345, 867)

func _update_appearance() -> void:
	region_enabled = true
	match health:
		3: region_rect = three_lives
		2: region_rect = two_lives
		1: region_rect = one_lives
		0: region_rect = no_lives
			

func _ready() -> void:
	#$Area2D.area_entered.connect(_on_enemy_entered)
	pass

func _get_health() -> int:
	return health

func _decrement_health() -> void:
	if health <= 0:
		return
	health -= 1
	_update_appearance()
	# Update the tower's appearance here.
	if health == 0:
		destroyed.emit()

func _on_tower_2_body_entered(body: Node2D) -> void:
	if not body.is_in_group("enemies") or body.is_queued_for_deletion():
		return
	body.queue_free()
	print("This shit do NOT work")
	_decrement_health()
		
