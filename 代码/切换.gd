extends CanvasLayer
@export var 动画: AnimationPlayer

	
func 淡入() -> void:
	动画.play("淡入")
	await 动画.animation_finished
	
	
func 淡出() -> void:
	动画.play("淡出")
	await 动画.animation_finished
