extends Control
@onready var timer: Timer = $Timer
@onready var 独白1: Label = $Label
@onready var 独白2: Label = $Label2


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
	if Input.is_action_pressed("跳跃") or Input.is_action_pressed("左键"):
		qiehuan1.淡入()
		await qiehuan1.淡入()
		get_tree().change_scene_to_file("res://场景/陆地.tscn")
		
		


func _on_timer_timeout() -> void:
	qiehuan1.淡入()
	await qiehuan1.淡入()
	get_tree().change_scene_to_file("res://场景/陆地.tscn")
