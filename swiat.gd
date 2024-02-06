extends Node3D
@onready var player = $auto

func _physics_process(delta):
	get_tree().call_group("enemies", "update_target_location", player.global_transform.origin)
