extends Node2D
func _ready():
	pass

func move(target):
	var ch_tween = $Ch_menu/ch_tween
	ch_tween.interpolate_property(self,"position",position,target,2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	ch_tween.start()
