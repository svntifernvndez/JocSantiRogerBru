extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var audioStream: AudioStream = preload('res://Grafics/salt2.wav')
	self.set_stream(audioStream)
	self.set_volume_db(-15)