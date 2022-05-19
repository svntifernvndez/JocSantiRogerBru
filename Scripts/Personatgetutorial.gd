extends KinematicBody2D

var velocitat_base = 150
var velocitat = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 1200
var velocitat_salt = -450
var cadena = false


func _ready():
	pass

func _physics_process(delta):
	velocitat.x = 0
	if not cadena:
		velocitat += gravetat * delta
	else:
		velocitat.y = 0
	if Input.is_action_pressed("ui_right"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("ui_left"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocitat.y = velocitat_salt

	if Input.is_action_pressed("ui_up"):
		if cadena:
			velocitat.y = -100
	if Input.is_action_pressed("ui_down"):
		if cadena:
			velocitat.y = 100
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
	animation(velocitat)

func animation(velocitat):
	if cadena:
		if velocitat.y == 0:
			$AnimatedSprite.play("escala2")
		else:
			$AnimatedSprite.play("escala")
		
	else:
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
		
		
		
#links:


func _on_Mort_body_entered(body):
	if body.is_in_group('Personatge'):
		get_tree().reload_current_scene()


func _on_Cadenes_pujar_body_entered(body):
	cadena = true


func _on_Cadenes_pujar_body_exited(body):
	cadena = false