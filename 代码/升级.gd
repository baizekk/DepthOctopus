extends Area2D
@onready var 碰撞: CollisionShape2D = $CollisionShape2D



func _on_body_entered(body: Node2D) -> void:
	quanjv.升级 = true
