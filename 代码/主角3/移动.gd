extends 状态节点
var 冲刺计时 := 0.0
var 碰撞大小 = CircleShape2D.new()

func 状态进入() -> void:
	冲刺计时 = 0.0
	print("进入移动")
	动画.play("移动")
	
	碰撞大小.radius = 7
	碰撞.shape = 碰撞大小
	碰撞.position = Vector2(0,1)
	
func 状态退出() -> void:
	quanjv.开始大冲 = false
	quanjv.力竭 = false
	冲刺计时 = 0.0
	
func 更新(delta : float) -> void:
	运动()
	quanjv.体力 -= 体力消耗 * delta
	
	if quanjv.体力 <= 0:
		quanjv.力竭 = true
		quanjv.体力 = 0
	
func 物理更新(delta : float) -> void:
	主角.velocity = 主角.velocity.lerp(Vector2(x*左右方向, y*上下方向), 0.03)
	if Input.is_action_pressed("冲刺"):
		冲刺计时 += delta
		
	#if Input.is_action_just_released("冲刺") and 冲刺计时 <= 0.3 and 冲刺计时 > 0.0:
		#quanjv.体力 -= 10
		#冲刺计时 = 0.0
		#if 左右方向 and 上下方向:
			#主角.velocity += Vector2(左右方向*冲刺速度/1.4, 上下方向*冲刺速度/1.4)
		#else:
			#主角.velocity += Vector2(左右方向*冲刺速度, 上下方向*冲刺速度)
			
			
	
		
	
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
		
	elif Input.is_action_just_released("冲刺") and 冲刺计时 <= 0.3 and 冲刺计时 > 0.0:
		print("冲刺")
		return "冲刺"
		
		
	elif 冲刺计时 > 0.3 and quanjv.没蓝 == false and Input.is_action_pressed("向下"):
		冲刺计时 = 0.0
		print("大冲")
		return "大冲"
		
	else:
		return ""
