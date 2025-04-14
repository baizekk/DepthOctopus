extends 状态节点
var 冲刺计时 := 0.0
var 碰撞大小 = CircleShape2D.new()

func 状态进入() -> void:
	动画.animation_finished.connect(_on_animated_sprite_2d_animation_finished)
	quanjv.体力 -= 10
	print("进入冲刺")
	动画.play("冲刺")
	if 左右方向 and 上下方向:
		主角.velocity += Vector2(左右方向*冲刺速度/1.4, 上下方向*冲刺速度/1.4)
	else:
		主角.velocity += Vector2(左右方向*冲刺速度, 上下方向*冲刺速度)
		
	碰撞大小.radius = 7
	碰撞.shape = 碰撞大小
	碰撞.position = Vector2(0,1)
	
func 状态退出() -> void:
	quanjv.冲刺结束 = false
	动画.animation_finished.disconnect(_on_animated_sprite_2d_animation_finished)
	
	
func 更新(delta : float) -> void:
	运动()
	quanjv.体力 -= 体力消耗 * delta
	
	if quanjv.体力 <= 0:
		quanjv.力竭 = true
		quanjv.体力 = 0
	
func 物理更新(delta : float) -> void:
	pass

func 跳转条件() -> String:
	if quanjv.冲刺结束:
		print("静止")
		return "静止"
		
	elif quanjv.力竭:
		print("变肥")
		return "变肥"
		
	elif Input.is_action_pressed("跳跃") and quanjv.没蓝 == false:
		print("变小")
		return "变小"
		
	else:
		return ""


func _on_animated_sprite_2d_animation_finished() -> void:
	quanjv.冲刺结束 = true
