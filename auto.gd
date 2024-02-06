extends VehicleBody3D
const ENGINE_POWER = 200
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	steering = lerp(steering,Input.get_axis("ui_right","ui_left")*0.4, 5*delta)
	engine_force = Input.get_axis("ui_down","ui_up")*ENGINE_POWER
#func sound():
	#$Engine.pitch_scale = linear_velocity.length()/1000+0.1
func _process(delta):
	var speed_meters_per_second = linear_velocity.length()
	var speed_kph = speed_meters_per_second * 3.6
	var kph_label:  Label = $"../CanvasLayer/Label"
	kph_label.text = "SPEED: " + str(round(speed_kph)) + "KPH"
