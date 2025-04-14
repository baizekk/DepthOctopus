extends 状态节点
@onready var 体力计时: Timer = $"../../体力计时"
var 碰撞大小 = CircleShape2D.new()
func 状态进入() -> void:
	print("进入静止")
	动画.play("静止")
	体力计时.start()
	
	
	碰撞大小.radius = 7
	碰撞.shape = 碰撞大小
	碰撞.position = Vector2(0,1)
	
	
	
func 状态退出() -> void:
	quanjv.体力计时 = false
	quanjv.力竭 = false
	体力计时.stop()
	
func 更新(delta : float) -> void:
	运动()
	
	
	if quanjv.体力计时:
		quanjv.体力 += 10 * delta
		
		
	if quanjv.体力 >= 100:
		quanjv.体力 = 100
		
	if quanjv.体力 <= 0:
		quanjv.力竭 = true
		quanjv.体力 = 0
	
	
func 物理更新(delta : float) -> void:
	主角.velocity = 主角.velocity.lerp(Vector2(0, -10), 0.03)
	
func 跳转条件() -> String:
	if not is_zero_approx(左右方向) or not is_zero_approx(上下方向):
		print("移动")
		return "移动"

	elif quanjv.力竭:
		print("变肥")
		return "变肥"
	
	elif Input.is_action_pressed("跳跃") and quanjv.没蓝 == false:
		print("变小")
		return "变小"
	
	else:
		return ""


func _on_体力计时_timeout() -> void:
	quanjv.体力计时 = true
