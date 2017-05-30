extends Area2D
var pressed = false
var entered = false
onready var t = get_node("../Timer") # Save Timer as variable

func _ready():
	get_node("Sprite/anim").play('idle')
	connect("body_enter",self,"_on_Area2D_body_enter")
	connect("body_exit",self,"_on_Area2D_body_exit")
	set_process(true)

func _on_Area2D_body_enter( body ):
	if (body extends preload("res://player.gd")) and !pressed:
		get_node("Sprite/anim").play('x')
		entered = true
		
		
func _on_Area2D_body_exit( body ):
	if (body extends preload("res://player.gd")) and !pressed:
		get_node("Sprite/anim").play('idle')
		entered = false
		
func _process(delta):
	if entered and !pressed:
			if Input.is_action_pressed("ui_x"):
				pressed = true
				get_node("Sprite/anim").play('open')
				get_node("../player/Sprite/anim").play('open')
				get_node("../player").switchmove()
				wait()

func wait():
    t.set_wait_time(1.2) # Set Timer's delay to "sec" seconds
    t.start() # Start the Timer counting down
    yield(t, "timeout") # Wait for the timer to wind down

    get_node("../part").show()
    get_node("../part2").show()
    get_node("../part3").show()
    get_node("../part3").show()
    get_node("../part4").show()

    t.set_wait_time(1) # Set Timer's delay to "sec" seconds
    t.start() # Start the Timer counting down
    yield(t, "timeout") # Wait for the timer to wind down
    get_node("../player").switchmove()
