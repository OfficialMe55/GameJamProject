extends Area3D

var playerInRange: bool = false

func _ready():
	pass

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		print("player entered")
		playerInRange = true


func _on_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		print("player left")
		playerInRange = false

func _process(_delta: float) -> void:
	if playerInRange and Input.is_action_just_pressed("interract"):
		print("shit happens")
	
