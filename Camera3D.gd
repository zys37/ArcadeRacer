extends Camera3D
const DISTANCE_BEHIND = -7.0
const HEIGHT_ABOVE = 3.0
@onready var target = $"../Resorak"
func _process(delta):
	if target:
		# Calculate the desired position for the camera
		var target_global_transform = target.global_transform
		var target_backward_vector = -target_global_transform.basis.z.normalized()
		var target_up_vector = target_global_transform.basis.y.normalized()
		var desired_position = target.global_transform.origin + (target_backward_vector * DISTANCE_BEHIND) + (target_up_vector * HEIGHT_ABOVE)
		
		# Set the camera's position
		global_transform.origin = desired_position
		
		# Make the camera look at the car
		look_at(target.global_transform.origin, Vector3.UP)
