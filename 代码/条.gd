extends Control
class_name 条

@export var 能量条: TextureProgressBar
@onready var 月亮: TextureRect = $"月亮"
var 显示 := 0
@onready var 动画: AnimationPlayer = $AnimationPlayer

@export var 体力条: TextureProgressBar


func _process(delta: float) -> void:
	显示 = 11 - quanjv.倒计时 / 2
	体力条.value = quanjv.体力
	体力条.tint_progress = Color(1,0.2 + quanjv.体力/200,0,0.9)
	
	能量条.value = quanjv.能量
	能量条.tint_progress = Color(0.5,0,quanjv.能量/100,0.9)
	
	#惨不忍睹啊。。。
	
	if 显示 <= 1:
		动画.play("1")
		
	elif 显示 <= 2:
		动画.play("2")
		
	elif 显示 <= 3:
		动画.play("3")
		
	elif 显示 <= 4:
		动画.play("4")
		
	elif 显示 <= 5:
		动画.play("5")
		
	elif 显示 <= 6:
		动画.play("6")
		
	elif 显示 <= 7:
		动画.play("7")
		
	elif 显示 <= 8:
		动画.play("8")
		
	elif 显示 <= 9:
		动画.play("9")
		
	elif 显示 <= 10:
		动画.play("10")
	
