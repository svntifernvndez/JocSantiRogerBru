extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Personatge.vides = 3
	print($Personatge.monedes)


func _process(delta):
	if $Personatge.vides < 3:
		$Vida4.visible = false
	if $Personatge.vides < 2:
		$Vida3.visible = false
	if $Personatge.vides < 1:
		$Vida2.visible = false
		get_tree().change_scene('res://Escenes/novides.tscn')
	if $Personatge.mor == true:
		$Personatge.position = Vector2(129, 45)
		$mort.play()
		$Personatge.vides -= 1
		$Personatge.mor = false


func _on_Personatge_mes_monedes(monedes):
	$Label.text = "Monedes: " + str(monedes)
	$moneda.play()
