extends KinematicBody2D

var velocitat_base = 150
var velocitat = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 1200
var velocitat_salt = -400

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
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h = false
		$Esquerra.set_deferred('disabled', false)
		$Dreta.set_deferred('disabled', true)
	elif velocitat.x < 0 and is_on_floor():
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h = true
		$Dreta.set_deferred('disabled', false)
		$Esquerra.set_deferred('disabled', true)
	if abs(velocitat.x) < 0.1 and is_on_floor():
		$AnimatedSprite.play("default")
	if velocitat.y != 0:
		$AnimatedSprite.play("salta")





func _on_Area2D_body_entered(body):
	position = Vector2(15, 184)


func _on_Cadenes_pujar_body_entered(body):
	while is_on_ceiling() == false:
		velocitat.y = -250
		


func _on_Cadenes_pujar_body_exited(body):
	velocitat.y = 0
