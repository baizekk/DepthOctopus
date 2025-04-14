extends 状态节点
@onready var 体力计时: Timer = $"../../体力计时"
var 碰撞大小 = CircleShape2D.new()
func 状态进入() -> void:
	动画.rotation = quanjv.转弧
	动画.animation_finished.connect(_on_animated_sprite_2d_animation_finished)
	
	print("进入变瘦")
	动画.play("变瘦")
	体力计时.start()
	
	
	碰撞大小.radius = 16
	碰撞.shape = 碰撞大小
	碰撞.position = Vector2(0,1)
	
	
func 状态退出() -> void:
	动画.animation_finished.disconnect(_on_animated_sprite_2d_animation_finished)
	变大完成 = false
	动画.rotation = 0.0
	
func 更新(delta : float) -> void:
	运动()
	
	quanjv.转弧 += 0.2 * delta
	动画.rotation = quanjv.转弧
	
func 物理更新(delta : float) -> void:
	pass
	
func 跳转条件() -> String:
	if 变大完成:
		print("静止")
		return "静止"

	else:
		return ""

func _on_animated_sprite_2d_animation_finished() -> void:
	变大完成 = true
