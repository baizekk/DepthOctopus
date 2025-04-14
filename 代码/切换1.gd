extends CanvasLayer
@onready var 颜色: ColorRect = $ColorRect

func _ready() -> void:
	颜色.color.a = 0
	
func 淡入() -> void:
	颜色.color.a = 0
	var 效果 := create_tween()
	效果.tween_property(颜色, "color:a", 1, 0.7)
	await 效果.finished
	
	
func 淡出() -> void:
	颜色.color.a = 1
	var 效果 := create_tween()
	效果.tween_property(颜色, "color:a", 0, 0.2)
	await 效果.finished
