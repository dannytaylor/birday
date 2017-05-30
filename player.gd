
extends Node

var player

var anim = "idle"
var new_anim = "idle"
var is_right = true
var move = 3
var move_ok = true

var entered = false
var pressed = false

func _ready():
	set_process(true)
	set_mode(2)
	get_node("Sprite/anim").play(anim)


func _process(delta):

	if move_ok:
		if Input.is_action_pressed("ui_right"):
			if !is_right:
				is_right = !is_right
				get_node("Sprite").set_flip_h(false)
			new_anim = "walk"
			var x = get_pos()
			if x.x<630:
				x.x += move
			set_pos(x)
		elif Input.is_action_pressed("ui_left"):
			if is_right:
				is_right = !is_right
				get_node("Sprite").set_flip_h(true)
			new_anim = "walk"
			var x = get_pos()
			if x.x>10:
				x.x -= move
			set_pos(x)
		else:
			new_anim = "idle"
	

	
	if (new_anim!=anim):
		anim = new_anim
		get_node("Sprite/anim").play(anim)

func switchmove():
	move_ok = !move_ok
	print(move_ok)
	
