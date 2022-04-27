extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Escenes/prova.tscn")


func _on_TextureButton_mouse_entered():
	$TextureButton.set_stretch_mode(1.7)


func _on_TextureButton_mouse_exited():
	$TextureButton.set_stretch_mode(1.5)
