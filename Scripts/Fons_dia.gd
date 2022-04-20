extends Node2D

var v1 = -$Personatge.velocitat * 0.05 * $Personatge.direccio
var v2 = -$Personatge.velocitat * 0.04 * $Personatge.direccio
var v3 = -$Personatge.velocitat * 0.03 * $Personatge.direccio
var v4 = -$Personatge.velocitat * 0.02 * $Personatge.direccio
var v5 = -$Personatge.velocitat * 0.01 * $Personatge.direccio



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.position += v1 * delta
	$Sprite1.position += v2 * delta
	$Sprite2.position += v3 * delta
	$Sprite3.position += v4 * delta
	$Sprite4.position += v5 * delta
