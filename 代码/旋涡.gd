extends Area2D

func _on_body_entered(body: Node2D) -> void:
	quanjv.进入旋涡 = true
	quanjv.旋涡位置 = Vector2(global_position.x,global_position.y)
func _on_body_exited(body: Node2D) -> void:
	quanjv.进入旋涡 = false
