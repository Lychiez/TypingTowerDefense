class_name Enemy
extends Node2D
signal enemyDeath(deathPos: Vector2i)
# Export enemy stats
@export var health = 100
@export var damage = 10
@export var speed = 10
# currWord set to "" for empty string, will be set when enemy spawns through spawn() func.
@export var currWord = ""

@onready var enemyText: RichTextLabel = $EnemyText
@onready var Sprite: AnimatedSprite2D = $Enemy

# Position is global to the scene/node in godot, so no need for position variable. 

func spawn() -> void:
	# Set Values for prototype, will likely be changed to be set based on enemy type
	# Static values for prototype
	health = 100
	damage = 10
	speed = 10
	visible = true
	currWord = WordClass.wordsList.pick_random()
	enemyText.text = currWord
	# set enemy text to be above the sprite
	# anchor preset set to center means you
	# don't have to change x position based on word size.

# Used to check accuracy, ie. change coloring of letters.
# For prototype, likely won't need to include it
# but this function will likely be updated to add checks
# and updates for accuracy.
func checkAcc(input: String) -> void:
	enemyText.clear()
	for i in range(currWord.length()):
		var letter_color := Color.WHITE
		if i < input.length():
			if input[i] == currWord[i]:
				letter_color = Color.GREEN
			else:
				letter_color = Color.RED
		enemyText.push_color(letter_color)
		enemyText.add_text(currWord[i])
		enemyText.pop()

func destroy() -> void:
	if health <= 0:
		visible = false
		print("+1 key")
		PlayerData.keys += 1
		enemyDeath.emit(global_position)
		print("signal emitted!")
	currWord = ""
	set_process(false)

func attack() -> void:
	pass

func touchingTower(Vector2) -> bool:
	return true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# spawn() is set in ready for enemy just for prototype
	# spawn() will be called by wave factory function in later
	# prototypes likely
	spawn()
	Sprite.play("default")

# _process will mainly be used for loading and for animating the sprites frames.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 30 * delta


func _on_tower_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
