extends Area2D


func _on_body_entered(body: Node2D) -> void:
	quanjv.体力 += 30.0
	Bgm.播放()
	queue_free()
