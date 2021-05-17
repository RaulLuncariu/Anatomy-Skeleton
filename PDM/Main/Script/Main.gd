extends Spatial

onready var menu1 = get_node("Menu1")
onready var menu2 = get_node("Menu2")
onready var menu3 = get_node("Menu3")
onready var text = get_node("MenuText")
onready var only = get_node("OnlyText")
onready var test = get_node("TestMenu")
onready var camera = get_node("Outer_gimble/Inner_gimble/Camera")

onready var Head_menu = get_node("MenuText/UI/ScrollContainer/VBoxContainer/Head")
onready var Chest_menu = get_node("MenuText/UI/ScrollContainer/VBoxContainer/Chest")
onready var Spine_menu = get_node("MenuText/UI/ScrollContainer/VBoxContainer/Spine")
onready var Arms_menu = get_node("MenuText/UI/ScrollContainer/VBoxContainer/Arms")
onready var Legs_menu = get_node("MenuText/UI/ScrollContainer/VBoxContainer/Legs")
onready var Color_menu = get_node("Menu2/UI/MenuButtons/ScrollContainer/VBoxContainer/BG color")

var text_bool = false
var menu1_bool = false
var menu2_bool = false

var red = 0
var green = 0
var blue = 0

var red2 = 0
var green2 = 0
var blue2 = 0

var score = 0
var skull = false
var ribs = false
var sternum = false
var column = false
var pelvis  = false
var humerus = false
var radius = false
var ulna = false
var clavicle = false
var scapula = false
var hand = false
var femur = false
var tibia = false
var fibula = false
var pattela = false
var foot = false


var wrong1 = false
var wrong2 = false
var wrong3 = false
var wrong4 = false
var wrong5 = false
var wrong6 = false
var wrong7 = false
var wrong8 = false
var wrong9 = false
var wrong10 = false


func _ready():
	Head_menu.get_popup().connect("id_pressed",self,"_on_item_pressed_head")
	Chest_menu.get_popup().connect("id_pressed",self,"_on_item_pressed_chest")
	Spine_menu.get_popup().connect("id_pressed",self,"_on_item_pressed_spine")
	Arms_menu.get_popup().connect("id_pressed",self,"_on_item_pressed_arms")
	Legs_menu.get_popup().connect("id_pressed",self,"_on_item_pressed_legs")
	

func _on_item_pressed_head(id):
	text_bool = true
	var head = Head_menu.get_popup().get_item_id(id)
	if head == 0:
		skull = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Skull.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Head.visible = true


func _on_item_pressed_chest(id):
	text_bool = true
	var chest = Chest_menu.get_popup().get_item_id(id)
	if chest == 0:
		ribs = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Ribs.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Chest.visible = true
	elif chest == 1:
		sternum = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Sternum.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Chest_plate.visible = true


func _on_item_pressed_spine(id):
	text_bool = true
	var spine = Spine_menu.get_popup().get_item_id(id)
	if spine == 0:
		column = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Spine.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Neck_piece_down.visible = true
		$Pieces/Neck_piece_up1.visible = true
		$Pieces/Neck_piece_up2.visible = true
		$Pieces/Spine.visible = true
	elif spine == 1:
		pelvis = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Pelvis.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Pelvis.visible = true


func _on_item_pressed_arms(id):
	text_bool = true
	var arms = Arms_menu.get_popup().get_item_id(id)
	if arms == 0:
		humerus = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Humerus.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Arm_Up.visible = true
	elif arms == 1:
		radius = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Radius.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Arm_Down2.visible = true
	elif arms == 2:
		ulna = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Ulna.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Arm_Down1.visible = true
	elif arms == 3:
		clavicle = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Clavicle.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Clavicle.visible = true
	elif arms == 4:
		scapula = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Scapula.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Scapula.visible = true
	elif arms == 5:
		hand = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Hand.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Hands.visible = true


func _on_item_pressed_legs(id):
	text_bool = true
	var legs = Legs_menu.get_popup().get_item_id(id)
	if legs == 0:
		femur = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Femur.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Leg_up.visible = true
	elif legs == 1:
		tibia = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Tibia.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Leg_down1.visible = true
	elif legs == 2:
		fibula = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Fibula.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Leg_down2.visible = true
	elif legs == 3:
		pattela = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Pattela.visible = true
		text.visible = false
		$Full.visible = false
		$Pieces/Knees.visible = true
	elif legs == 4:
		foot = true
		$OnlyText/UI/ScrollContainer/VBoxContainer/Foot.visible  = true
		text.visible = false
		$Full.visible = false
		$Pieces/Feet.visible = true


func _process(delta):
	camera.translation.z = clamp(camera.translation.z,0.5,2)
	$Finish/Final_score.add_color_override("font_color",Color(0,0,0,1))
	$Menu2/UI/ScrollContainer/VBoxContainer/Sample.color = Color(red/255,green/255,blue/255,1)
	$OnlyText/Backround/ColorRect.color = Color(red/255,green/255,blue/255,1)
	$Menu2/UI/ScrollContainer2/VBoxContainer/Sample2.color = Color(red2/255,green2/255,blue2/255,1)
	$OnlyText/UI/ScrollContainer/VBoxContainer/Clavicle.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Skull.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Ribs.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Sternum.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Humerus.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Radius.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Ulna.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Hand.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Spine.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Pelvis.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Femur.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Fibula.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Tibia.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Foot.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Scapula.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))
	$OnlyText/UI/ScrollContainer/VBoxContainer/Pattela.add_color_override("font_color",Color(red2/255,green2/255,blue2/255,1))


func _on_3DModel_pressed():
	menu1.visible = false
	menu2.visible = false
	only.visible = false
	text.visible = false
	test.visible = false
	$Full.visible = true
	$Pieces/Arm_Down1.visible = false
	$Pieces/Arm_Down2.visible = false
	$Pieces/Arm_Up.visible = false
	$Pieces/Chest.visible = false
	$Pieces/Chest_plate.visible = false
	$Pieces/Clavicle.visible = false
	$Pieces/Feet.visible = false
	$Pieces/Hands.visible = false
	$Pieces/Head.visible = false
	$Pieces/Knees.visible = false
	$Pieces/Leg_down1.visible = false
	$Pieces/Leg_down2.visible = false
	$Pieces/Leg_up.visible = false
	$Pieces/Neck_piece_down.visible = false
	$Pieces/Neck_piece_up1.visible = false
	$Pieces/Neck_piece_up2.visible = false
	$Pieces/Pelvis.visible = false
	$Pieces/Scapula.visible = false
	$Pieces/Spine.visible = false


func _on_Quit_pressed():
	get_tree().quit()


func _on_Settings_pressed():
	menu1.visible = false


func _on_BackMenu2_pressed():
	menu1.visible = true


func _on_BackMenu3_pressed():
	if text_bool == true:
		text_bool = false
		text.visible = true
		only.visible = true
		$Pieces/Arm_Down1.visible = false
		$Pieces/Arm_Down2.visible = false
		$Pieces/Arm_Up.visible = false
		$Pieces/Chest.visible = false
		$Pieces/Chest_plate.visible = false
		$Pieces/Clavicle.visible = false
		$Pieces/Feet.visible = false
		$Pieces/Hands.visible = false
		$Pieces/Head.visible = false
		$Pieces/Knees.visible = false
		$Pieces/Leg_down1.visible = false
		$Pieces/Leg_down2.visible = false
		$Pieces/Leg_up.visible = false
		$Pieces/Neck_piece_down.visible = false
		$Pieces/Neck_piece_up1.visible = false
		$Pieces/Neck_piece_up2.visible = false
		$Pieces/Pelvis.visible = false
		$Pieces/Scapula.visible = false
		$Pieces/Spine.visible = false
		$Full.visible = true
	else:
		menu2.visible = true
		menu1.visible = true
		text.visible = true
		only.visible = true
		test.visible = true


func _on_Text_pressed():
	menu1.visible = false
	menu2.visible = false


func _on_Back_pressed():
	menu1.visible = true
	menu2.visible = true
	$Pieces/Arm_Down1.visible = false
	$Pieces/Arm_Down2.visible = false
	$Pieces/Arm_Up.visible = false
	$Pieces/Chest.visible = false
	$Pieces/Chest_plate.visible = false
	$Pieces/Clavicle.visible = false
	$Pieces/Feet.visible = false
	$Pieces/Hands.visible = false
	$Pieces/Head.visible = false
	$Pieces/Knees.visible = false
	$Pieces/Leg_down1.visible = false
	$Pieces/Leg_down2.visible = false
	$Pieces/Leg_up.visible = false
	$Pieces/Neck_piece_down.visible = false
	$Pieces/Neck_piece_up1.visible = false
	$Pieces/Neck_piece_up2.visible = false
	$Pieces/Pelvis.visible = false
	$Pieces/Scapula.visible = false
	$Pieces/Spine.visible = false
	$Full.visible = true


func _on_Back_text_pressed():
	$OnlyText/UI/ScrollContainer/VBoxContainer/Skull.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Ribs.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Sternum.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Spine.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Pelvis.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Humerus.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Radius.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Ulna.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Clavicle.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Scapula.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Hand.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Femur.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Tibia.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Fibula.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Pattela.visible = false
	$OnlyText/UI/ScrollContainer/VBoxContainer/Foot.visible = false
	$Pieces/Arm_Down1.visible = false
	$Pieces/Arm_Down2.visible = false
	$Pieces/Arm_Up.visible = false
	$Pieces/Chest.visible = false
	$Pieces/Chest_plate.visible = false
	$Pieces/Clavicle.visible = false
	$Pieces/Feet.visible = false
	$Pieces/Hands.visible = false
	$Pieces/Head.visible = false
	$Pieces/Knees.visible = false
	$Pieces/Leg_down1.visible = false
	$Pieces/Leg_down2.visible = false
	$Pieces/Leg_up.visible = false
	$Pieces/Neck_piece_down.visible = false
	$Pieces/Neck_piece_up1.visible = false
	$Pieces/Neck_piece_up2.visible = false
	$Pieces/Pelvis.visible = false
	$Pieces/Scapula.visible = false
	$Pieces/Spine.visible = false
	$Full.visible = true
	text.visible = true
	skull = false
	ribs = false
	sternum = false
	column = false
	pelvis  = false
	humerus = false
	radius = false
	ulna = false
	clavicle = false
	scapula = false
	hand = false
	femur = false
	tibia = false
	fibula = false
	pattela = false
	foot = false


func _on_3D_pressed():
	only.visible = false
	test.visible = false


func _on_Zoom_in_pressed():
	camera.translation.z -= 0.5


func _on_Zoom_out_pressed():
	camera.translation.z += 0.5


func _on_Red_scrolling():
	red = $Menu2/UI/ScrollContainer/VBoxContainer/Red.value


func _on_Green_scrolling():
	green = $Menu2/UI/ScrollContainer/VBoxContainer/Green.value


func _on_Blue_scrolling():
	blue = $Menu2/UI/ScrollContainer/VBoxContainer/Blue.value


func _on_Red2_scrolling():
	red2 = $Menu2/UI/ScrollContainer2/VBoxContainer/Red2.value


func _on_Green2_scrolling():
	green2 = $Menu2/UI/ScrollContainer2/VBoxContainer/Green2.value


func _on_Blue2_scrolling():
	blue2 = $Menu2/UI/ScrollContainer2/VBoxContainer/Blue2.value


func _on_Wikipedia_pressed():
	if skull:
		OS.shell_open("https://en.wikipedia.org/wiki/Skull#Humans")
	if ribs:
		OS.shell_open("https://en.wikipedia.org/wiki/Rib_cage")
	if sternum:
		OS.shell_open("https://en.wikipedia.org/wiki/Sternum")
	if column:
		OS.shell_open("https://en.wikipedia.org/wiki/Vertebral_column")
	if pelvis:
		OS.shell_open("https://en.wikipedia.org/wiki/Pelvis")
	if humerus:
		OS.shell_open("https://en.wikipedia.org/wiki/Humerus")
	if radius:
		OS.shell_open("https://en.wikipedia.org/wiki/Radius_(bone)")
	if ulna:
		OS.shell_open("https://en.wikipedia.org/wiki/Ulna")
	if clavicle:
		OS.shell_open("https://en.wikipedia.org/wiki/Clavicle")
	if scapula:
		OS.shell_open("https://en.wikipedia.org/wiki/Scapula")
	if hand:
		OS.shell_open("https://en.wikipedia.org/wiki/Hand#Bones")
	if femur:
		OS.shell_open("https://en.wikipedia.org/wiki/Femur")
	if tibia:
		OS.shell_open("https://en.wikipedia.org/wiki/Tibia")
	if fibula:
		OS.shell_open("https://en.wikipedia.org/wiki/Fibula")
	if pattela:
		OS.shell_open("https://en.wikipedia.org/wiki/Patella")
	if foot:
		OS.shell_open("https://en.wikipedia.org/wiki/Foot#Bones")




func _on_Youtube_pressed():
	if skull:
		OS.shell_open("https://www.youtube.com/watch?v=FokqeUi9hPs")
	if ribs:
		OS.shell_open("https://www.youtube.com/watch?v=ggJCoxOdv8c")
	if sternum:
		OS.shell_open("https://www.youtube.com/watch?v=QqJt-lY1k8Y")
	if column:
		OS.shell_open("https://www.youtube.com/watch?v=u9EF42SWVTk")
	if pelvis:
		OS.shell_open("https://www.youtube.com/watch?v=14mCQVImWKQ")
	if humerus:
		OS.shell_open("https://www.youtube.com/watch?v=qX1a0u8gpKw")
	if radius:
		OS.shell_open("https://www.youtube.com/watch?v=Iki7NdqdgTE")
	if ulna:
		OS.shell_open("https://www.youtube.com/watch?v=fLBXo8NPUSw")
	if clavicle:
		OS.shell_open("https://www.youtube.com/watch?v=cbUToG4ZOcU")
	if scapula:
		OS.shell_open("https://www.youtube.com/watch?v=zBbl8CYE9t8")
	if hand:
		OS.shell_open("https://www.youtube.com/watch?v=zyl6eoU-3Rg")
	if femur:
		OS.shell_open("https://www.youtube.com/watch?v=CSRciozqomQ")
	if tibia:
		OS.shell_open("https://www.youtube.com/watch?v=uxDxrbE7z3s")
	if fibula:
		OS.shell_open("https://www.youtube.com/watch?v=8Y4WZxDnEEM")
	if pattela:
		OS.shell_open("https://www.youtube.com/watch?v=C84nCymAvJM")
	if foot:
		OS.shell_open("https://www.youtube.com/watch?v=BQTV-iUFAl0")



func _on_Test_pressed():
	menu1.visible = false
	menu2.visible = false
	text.visible = false
	only.visible = false


func _on_Answer12_pressed():
	if not wrong1:
		score += float(1)/float(3)


func _on_Answer13_pressed():
	if not wrong1:
		score += float(1)/float(3)


func _on_Answer15_pressed():
	if not wrong1:
		score += float(1)/float(3)


func _on_Answer22_pressed():
	if not wrong2:
		score += float(1)


func _on_Answer35_pressed():
	if not wrong3:
		score += float(1)


func _on_Answer41_pressed():
	if not wrong4:
		score += float(1)/float(2)


func _on_Answer44_pressed():
	if not wrong4:
		score += float(1)/float(2)


func _on_Answer52_pressed():
	if not wrong5:
		score += float(1)/float(2)


func _on_Answer54_pressed():
	if not wrong5:
		score += float(1)/float(2)


func _on_Answer65_pressed():
	if not wrong6:
		score += float(1)


func _on_Answer73_pressed():
	if not wrong7:
		score += float(1)


func _on_Answer81_pressed():
	if not wrong8:
		score += float(1)


func _on_Answer93_pressed():
	if not wrong9:
		score += float(1)


func _on_Answer101_pressed():
	if not wrong10:
		score += float(1)/float(3)


func _on_Answer102_pressed():
	if not wrong10:
		score += float(1)/float(3)


func _on_Answer103_pressed():
	if not wrong10:
		score += float(1)/float(3)


func _on_Finish_pressed():
	test.visible = false
	if float(score) >= 0 and float(score) <= 4:
		$Finish/Final_score.set_text("I'm sorry but you should look again on the materials.")
	elif float(score) > 4 and float(score) <= 8:
		$Finish/Final_score.set_text("Good but you can do better!")
	elif float(score) > 8 and float(score) <= 10:
		$Finish/Final_score.set_text("Congratulations, you passed the test!")
	yield(get_tree().create_timer(3),"timeout")
	menu1.visible = true
	menu2.visible = true
	text.visible = true
	only.visible = true
	test.visible = true


func _on_Answer11_pressed():
	wrong1 = true


func _on_Answer14_pressed():
	wrong1 = true


func _on_Answer21_pressed():
	wrong2 = true


func _on_Answer23_pressed():
	wrong2 = true


func _on_Answer24_pressed():
	wrong2 = true


func _on_Answer25_pressed():
	wrong2 = true


func _on_Answer31_pressed():
	wrong3 = true


func _on_Answer32_pressed():
	wrong3 = true


func _on_Answer34_pressed():
	wrong3 = true


func _on_Answer33_pressed():
	wrong3 = true


func _on_Answer42_pressed():
	wrong4 = true


func _on_Answer43_pressed():
	wrong4 = true


func _on_Answer45_pressed():
	wrong4 = true


func _on_Answer53_pressed():
	wrong5 = true


func _on_Answer55_pressed():
	wrong5 = true


func _on_Answer51_pressed():
	wrong5 = true


func _on_Answer61_pressed():
	wrong6 = true


func _on_Answer62_pressed():
	wrong6 = true


func _on_Answer63_pressed():
	wrong6 = true


func _on_Answer64_pressed():
	wrong6 = true


func _on_Answer71_pressed():
	wrong7 = true


func _on_Answer72_pressed():
	wrong7 = true


func _on_Answer74_pressed():
	wrong7 = true


func _on_Answer75_pressed():
	wrong7 = true


func _on_Answer82_pressed():
	wrong8 = true


func _on_Answer83_pressed():
	wrong8 = true


func _on_Answer84_pressed():
	wrong8 = true


func _on_Answer85_pressed():
	wrong8 = true


func _on_Answer91_pressed():
	wrong9 = true


func _on_Answer92_pressed():
	wrong9 = true


func _on_Answer94_pressed():
	wrong9 = true


func _on_Answer95_pressed():
	wrong9 = true


func _on_Answer104_pressed():
	wrong10 = true


func _on_Answer105_pressed():
	wrong10 = true


func _on_Cancel_pressed():
	menu1.visible = true
	menu2.visible = true
	text.visible = true
	only.visible = true
	score = 0
	wrong1 = false
	wrong2 = false
	wrong3 = false
	wrong4 = false
	wrong5 = false
	wrong6 = false
	wrong7 = false
	wrong8 = false
	wrong9 = false
	wrong10 = false
