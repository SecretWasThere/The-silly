extends Area2D

var player_in_range = false

@onready var prompt = $"M Fake"
@onready var dialogue = $"M message"

func _ready():
	prompt.visible = false
	dialogue.visible = false


func _on_body_entered(body: Node2D) -> void:
	if body.name == "PLAYER":
		player_in_range = true
		prompt.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.name == "PLAYER":
		player_in_range = false
		prompt.visible = false
		dialogue.visible = false


func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		dialogue.visible = !dialogue.visible
