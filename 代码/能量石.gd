extends Area2D


func _on_body_entered(body: Node2D) -> void:
	quanjv.能量 += 20
	Bgm.播放()
	queue_free()
