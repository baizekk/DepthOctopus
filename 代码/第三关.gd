extends Node2D
@export var 相机: Camera2D
@export var 主角: CharacterBody2D
var 主角存档 : Vector2
@onready var 教学文本: Label = $UI/Label3
@onready var 教学文本2: Label = $UI/Label4



func _ready() -> void:
	quanjv.复活过 = false
	qiehuan.淡出()
	主角.velocity.y = 300
	主角存档 = 主角.position
	相机.reset_smoothing()
	相机.force_update_scroll()
	quanjv.体力 = 100
	quanjv.能量 = 100
	quanjv.倒计时 = 20.0
	if quanjv.中文:
		教学文本2.visible = true
		教学文本.visible = false
		
	else:
		教学文本.visible = true
		教学文本2.visible = false
	
	
	
func _process(delta: float) -> void:
	if quanjv.文本3时间到:
		教学文本.visible = false
		教学文本2.visible = false
		
	quanjv.倒计时 -= delta
	if Input.is_action_pressed("跳跃") and quanjv.没蓝 == false and quanjv.可以相机缩放 == true:
		相机.zoom = 相机.zoom.lerp(Vector2(10, 10), 0.005)
		quanjv.相机缩小 = true
	else:
		相机.zoom = 相机.zoom.lerp(Vector2(5, 5), 0.02)

	if quanjv.死亡 or quanjv.倒计时 <= 0:
		qiehuan.淡入()
		await qiehuan.淡入()
		if quanjv.复活过 == false:
			复活()
			quanjv.复活过 = true
	
	if quanjv.通关 == true:
		
		qiehuan.淡入()
		await qiehuan.淡入()
		if get_tree() != null:
			通关()
		
		
func 通关():
	quanjv.通关 = false
	get_tree().change_scene_to_file("res://场景/通关.tscn")
	
func 复活():
	if get_tree() != null:
			get_tree().change_scene_to_file("res://场景/第三关.tscn")
	quanjv.死亡 = false
	qiehuan.淡出()
	quanjv.倒计时 = 20.0


func _on_文本时间_timeout() -> void:
	quanjv.文本3时间到 = true
