extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$win.play()
	
func _process(delta):
	if Input.is_action_pressed("R"):
		get_tree().change_scene("res://Escenes/pantallainici.tscn")
