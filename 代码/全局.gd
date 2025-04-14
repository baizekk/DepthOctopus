extends Node2D

#关卡切换相关
var 切换第一关 := false
var 升级 := false
var 通关 := false
#技能相关
var 开始大冲 := false
var 能量 := 100.0
var 没蓝 := false
var 转弧 := 0.0

#相机相关
var 相机缩小 := false
var 可以相机缩放 := true

#休息相关
var 体力 := 100.0
var 体力计时 := false
var 力竭 := false
var 恢复 := false
var 冲刺结束 := false

#死亡相关
var 死亡 := false
var 倒计时 := 20.0
var 复活过 := false

#洋流相关
var 进入洋流 := false
var 进入旋涡 := false
var 旋涡位置 : Vector2

#文本相关
var 文本1时间到 = false
var 文本2时间到 = false
var 文本3时间到 = false
var 中文 = false
