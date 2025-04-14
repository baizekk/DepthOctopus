extends Node
class_name 状态节点


var 左右方向 := 0
var 上下方向 := 0
var 速度们 := Vector2(120,120)
var x := 速度们.x
var y := 速度们.y
var 冲刺速度 := 200
@export var 体力消耗 := 2.5
@export var 能量消耗 := 10

@export var 主角: CharacterBody2D
#@export var 动画1: AnimationPlayer
@export var 动画: AnimatedSprite2D
#@export var 立绘: Sprite2D
@export var 碰撞: CollisionShape2D

var 变瘦完成 := false
var 变大完成 := false
var 变小完成 := false

func _ready() -> void:
	await owner.ready
	
func _process(delta: float) -> void:
	if quanjv.能量 > 0:
		quanjv.没蓝 = false
		
func _physics_process(delta: float) -> void:
	左右方向 = Input.get_axis("向左", "向右")
	上下方向 = Input.get_axis("向上", "向下")
	
func 状态进入() -> void:
	pass
	
func 状态退出() -> void:
	pass
	
func 更新(delta : float) -> void:
	pass
	
	
func 物理更新	(delta : float) -> void:
	pass
	
func 跳转条件() -> String:
	return ""
	
func 运动():
	if 左右方向 > 0:
		动画.flip_h = false
	elif 左右方向 < 0:
		动画.flip_h = true
	主角.move_and_slide()
	
