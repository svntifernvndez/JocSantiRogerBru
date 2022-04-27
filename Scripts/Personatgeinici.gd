extends KinematicBody2D

var velocitat_base = int(200)
var velocitat = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -500

func _ready():
	velocitat.x = velocitat_base

func _physics_process(delta):

	velocitat += gravetat * delta
	if position.x >= 1024:
		velocitat = Vector2.LEFT * velocitat_base
		position.x = 1023
	if position.x <= 0:
		position.x = 1
		velocitat = Vector2.RIGHT * velocitat_base
	velocitat = move_and_slide(velocitat, Vector2.UP)
	animation(velocitat)

func animation(velocitat):
	if velocitat.x > 0 and is_on_floor():
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h = false
	elif velocitat.x < 0 and is_on_floor():
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h = true
	if abs(velocitat.x) < 0.1 and is_on_floor():
		$AnimatedSprite.play("default")
	if velocitat.y != 0:
		$AnimatedSprite.play("salta")






func _on_Timer_timeout():
	velocitat.y = velocitat_salt


func _on_Area2D2_body_entered(body):
	velocitat.x = -velocitat_base 


func _on_Area2D3_body_entered(body):
	velocitat = velocitat_base
