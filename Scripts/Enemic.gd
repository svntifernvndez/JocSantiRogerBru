extends KinematicBody2D

var velocitat_base = 250 
var velocitat = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 1200
var velocitat_salt = -600

func _ready():
	pass

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("ui_right"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("ui_left"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocitat.y = velocitat_salt
	velocitat = move_and_slide(velocitat, Vector2.UP)
	animation(velocitat)

func animation(velocitat):
	if velocitat.x > 0 and is_on_floor():
		$AnimatedSprite.play("camina")
		$AnimatedSprite.flip_h = false
	elif velocitat.x < 0 and is_on_floor():
		$AnimatedSprite.play("camina")
		$AnimatedSprite.flip_h = true
	if abs(velocitat.x) < 0.1 and is_on_floor():
		$AnimatedSprite.play("default")
	if velocitat.y < 0:
		$AnimatedSprite.play("salta")
	if velocitat.y > 0:
		$AnimatedSprite.play("cau")
