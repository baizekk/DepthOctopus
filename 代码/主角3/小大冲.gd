extends 状态节点
var 碰撞大小 = CircleShape2D.new()
func 状态进入() -> void:
	print("进入小大冲")
	碰撞大小.radius = 3
	碰撞.shape = 碰撞大小
	
	
func 状态退出() -> void:
	quanjv.力竭 = false
	
func 更新(delta : float) -> void:
	运动()
	quanjv.体力 -= 体力消耗 * delta
	quanjv.能量 -= 能量消耗 * delta * 2
	if quanjv.能量 <= 0:
		quanjv.没蓝 = true
		quanjv.能量 = 0
	
	if quanjv.体力 <= 0:
		quanjv.力竭 = true
		quanjv.体力 = 0
	
func 物理更新(delta : float) -> void:
	主角.velocity = 主角.velocity.lerp(Vector2(x*左右方向*0.3, 400), 0.05)
	
		
	
func 跳转条件() -> String:
	if not Input.is_action_pressed("跳跃") and Input.is_action_pressed("向下"):
		print("大冲")
		return "大冲"
		
	elif quanjv.没蓝:
		print("大冲")
		return "大冲"
		
	elif quanjv.力竭:
		print("变肥")
		return "变肥"
	
	elif not Input.is_action_pressed("跳跃"):
		print("变大")
		return "变大"
		
	elif not Input.is_action_pressed("冲刺") and quanjv.没蓝 == false:
		print("小孩")
		return "小孩"
		
	elif quanjv.没蓝 == false and not Input.is_action_pressed("向下"):
		print("小孩")
		return "小孩"
		
	else:
		return ""
