extends 状态节点
var 碰撞大小 = CircleShape2D.new()
func 状态进入() -> void:
	print("进入大冲")
	动画.play("大冲")
	
	碰撞大小.radius = 7
	碰撞.shape = 碰撞大小
	碰撞.position = Vector2(0,1)
	
func 状态退出() -> void:
	quanjv.力竭 = false
	
func 更新(delta : float) -> void:
	运动()
	quanjv.体力 -= 体力消耗 * delta
	quanjv.能量 -= 能量消耗 * delta*2
	if quanjv.能量 <= 0:
		quanjv.能量 = 0
		quanjv.没蓝 = true
	
	if quanjv.体力 <= 0:
		quanjv.力竭 = true
		quanjv.体力 = 0
	
func 物理更新(delta : float) -> void:
	主角.velocity = 主角.velocity.lerp(Vector2(x*左右方向*0.3, 400), 0.05)
	
		
	
func 跳转条件() -> String:
	if is_zero_approx(左右方向) and is_zero_approx(上下方向):
		print("静止")
		return "静止"
	
	elif Input.is_action_pressed("跳跃") and quanjv.没蓝 == false:
		print("变小")
		return "变小"
	
	elif quanjv.力竭:
		print("变肥")
		return "变肥"
		
	elif not Input.is_action_pressed("冲刺") or quanjv.没蓝 or not Input.is_action_pressed("向下"):
		print("移动")
		return "移动"
		
	else:
		return ""
