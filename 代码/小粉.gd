extends CharacterBody2D
@onready var 立绘: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	if quanjv.进入旋涡:
		global_position = global_position.lerp(quanjv.旋涡位置, 0.05)
		
