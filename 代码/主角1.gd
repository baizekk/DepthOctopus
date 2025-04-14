extends CharacterBody2D
var 重力加速度 := 980
var 跳跃速度 := -220
var 速度 := 80
@export var 动画: AnimatedSprite2D

func _process(delta: float) -> void:
	move_and_slide()
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += 重力加速度 * delta

	if Input.is_action_just_pressed("跳跃") and is_on_floor():
		velocity.y = 跳跃速度


	var direction := Input.get_axis("向左", "向右")
	if direction > 0:
		动画.flip_h = false
		
	elif  direction < 0:
		动画.flip_h = true
	
	if direction:
		动画.play("跑步")
		velocity.x = move_toward(velocity.x, direction * 速度, 100)
	else:
		动画.play("站立")
		velocity.x = move_toward(velocity.x, 0, 100)
