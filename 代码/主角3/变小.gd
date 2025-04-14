extends 状态节点
var 碰撞大小 = CircleShape2D.new()

func 状态进入() -> void:
	动画.animation_finished.connect(_on_animated_sprite_2d_animation_finished)
	print("进入变小")
	动画.play("变小")
	碰撞大小.radius = 3
	
	碰撞.shape = 碰撞大小
	碰撞.position = Vector2(0,0)
	
func 状态退出() -> void:
	动画.animation_finished.disconnect(_on_animated_sprite_2d_animation_finished)
	变小完成 = false
	
func 更新(delta : float) -> void:
	运动()
	quanjv.体力 -= 体力消耗 * delta
	quanjv.能量 -= 能量消耗 * delta
	if quanjv.体力 <= 0:
		quanjv.力竭 = true
		quanjv.体力 = 0
	
	
	if quanjv.能量 <= 0:
		quanjv.没蓝 = true
		quanjv.能量 = 0
		
	
func 物理更新(delta : float) -> void:
	主角.velocity = 主角.velocity.lerp(Vector2(x*左右方向, y*上下方向), 0.03)
	
func 跳转条件() -> String:
	if not Input.is_action_pressed("跳跃") or quanjv.没蓝:
		print("变大")
		return "变大"
		
	elif 变小完成:
		print("小孩")
		return "小孩"
		
	elif quanjv.力竭:
		print("变肥")
		return "变肥"
		
	else:
		return ""
		
func _on_animated_sprite_2d_animation_finished() -> void:
	变小完成 = true
