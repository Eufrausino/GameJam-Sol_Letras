extends AnimatedSprite

const EXPLOSION: PackedScene = preload("res://Fx/Explosion/Explosion.tscn")

func _ready() -> void:
	if Global.flag_spikes_disabled:
		queue_free()

func kill()->void:
	Global.instance_on_main(EXPLOSION,global_position)
	Global.flag_spikes_disabled = true
	queue_free()
