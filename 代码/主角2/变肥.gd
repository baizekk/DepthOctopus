extends 状态节点
var 碰撞大小 = CircleShape2D.new()

func 状态进入() -> void:
	print("进入变肥")
	动画.play("变肥")
	quanjv.可以相机缩放 = false
	
	碰撞大小.radius = 16
	碰撞.shape = 碰撞大小
	碰撞.position = Vector2(0,0)
	
func 状态退出() -> void:
	quanjv.恢复 = false
	动画.rotation = 0.0
	quanjv.可以相机缩放 = true
	
	
func 更新(delta : float) -> void:
	主角.move_and_slide()
	quanjv.体力 += 20 * delta
	if quanjv.体力 >= 100:
		quanjv.体力 = 100
		quanjv.恢复 = true
	
func 物理更新(delta : float) -> void:
	主角.velocity = 主角.velocity.lerp(Vector2(x*左右方向*0.2, -150), 0.01)
	quanjv.转弧 += 0.2 * delta
	动画.rotation = quanjv.转弧
	
func 跳转条件() -> String:
	if quanjv.恢复:
		print("变瘦")
		return "变瘦"
		
	else:
		return ""
