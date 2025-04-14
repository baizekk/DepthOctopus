extends Area2D
@onready var 光: PointLight2D = $PointLight2D
var a := 0.0
var b := 0.0
var c := 0.0
var a向上 : bool
var b向上 : bool
var c向上 : bool
var 颜色 = Color(a,b,c,0.5)
func _process(delta: float) -> void:
	if a<=0:
		a向上 = true
	elif a>=1:
		a向上 = false
	
	if a向上:
		a += 0.006
		
	if a向上 == false:
		a -= 0.008
		

	if b<=0:
		b向上 = true
	elif b>=1:
		b向上 = false
		
	if b向上:
		b += 0.003
	if b向上 == false:
		b -= 0.007
		
	if c<=0:
		c向上 = true
	elif c>=1:
		c向上 = false
	
	if c向上:
		c += 0.003
		
	if c向上 == false:
		c -= 0.005
	颜色 = Color(a,b,c,0.5)
	光.color = 颜色



func _on_body_entered(body: Node2D) -> void:
	quanjv.通关 = true
