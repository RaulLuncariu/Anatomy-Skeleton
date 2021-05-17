  extends Node2D


func _ready():
	pass

func _on_Start_pressed():
	get_node("MenuButtons/Start").move(Vector2(-576, 0))
	get_node("MenuButtons/Ch_menu").move(Vector2(0, 0))


func _on_Back_pressed():
	get_node("MenuButtons/Start").move(Vector2(0, 0))
	get_node("MenuButtons/Ch_menu").move(Vector2(576, 0))



