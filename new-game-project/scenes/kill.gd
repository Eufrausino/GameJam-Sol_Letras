extends Area2D

@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("a",body.name,"a")
	if (body.name == 'Lyra'):
		timer.start()

	
	


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
