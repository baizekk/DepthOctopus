extends Control
@onready var 开始游戏: Button = $Button
@onready var 语言选择: Panel = $Panel

func _ready() -> void:
	语言选择.visible = false



func _on_button_button_down() -> void:
	qiehuan1.淡入()
	await qiehuan1.淡入()
	get_tree().change_scene_to_file("res://场景/独白.tscn")

func _on_文本_button_down() -> void:
	语言选择.visible = true

func _on_英文_button_down() -> void:
	语言选择.visible = false
	quanjv.中文 = false

func _on_中文_button_down() -> void:
	语言选择.visible = false
	quanjv.中文 = true
