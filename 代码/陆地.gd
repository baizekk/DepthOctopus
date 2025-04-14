extends Node2D
@onready var 独白1: Control = $"CanvasLayer/教学文本"
@onready var 独白2: Control = $"CanvasLayer/教学文本2"

func _ready() -> void:
	if quanjv.中文:
		独白2.visible = true
		独白1.visible = false
	else:
		独白1.visible = true
		独白2.visible = false
		
		
	qiehuan1.淡出()
	await qiehuan1.淡出()
	

func _process(delta: float) -> void:
	if quanjv.切换第一关:
		quanjv.切换第一关 = false
		qiehuan.淡入()
		await qiehuan.淡入()
		if get_tree() != null:
			get_tree().change_scene_to_file("res://场景/第一关.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	quanjv.切换第一关 = true
