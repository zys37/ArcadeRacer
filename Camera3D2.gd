extends Camera3D

var target : Node3D # The object the camera will follow
var distance = Vector3(0, 4, -8)  # Distance from the target
var lerp_speed = 6  # Speed at which the camera moves to follow the target
var rotation_offset = 20.0

func _ready():
	target = get_node("../Resorak") # Set the target object (replace with your node path)

func _process(delta):
	if target != null:
		var target_global_transform = target.global_transform
		var target_position = target_global_transform.origin
		var target_rotation = target_global_transform.basis.get_euler()
		
		var camera_offset = Vector3(distance.x, distance.y, distance.z + abs(distance.x / rotation_offset))
		var rotated_offset = camera_offset.rotated(Vector3(0, 1, 0), target_rotation.y)
		var new_position = target_position + rotated_offset
		var car_forward = -target_global_transform.basis.z.normalized()
		var target_rotation_y = atan2(car_forward.x, -car_forward.z)
		var new_rotation = Vector3(target_rotation.x, target_rotation_y, target_rotation.z)
		
		global_transform.origin = global_transform.origin.lerp(new_position, lerp_speed * delta)
		global_transform.basis = Basis().rotated(Vector3(0, 1, 0), new_rotation.y)
