extends Control

func _ready() -> void:
	qiehuan.淡出()
	await qiehuan.淡出()
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("跳跃") or Input.is_action_pressed("左键"):
		get_tree().quit()
