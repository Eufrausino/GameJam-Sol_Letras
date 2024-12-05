extends Area2D

@onready var timer = $Timer


func _on_body_entered(body:Node2D) -> void:
	timer.start()
	pass # Replace with function body.

func _on_timer_timeout(): 
	get_tree().reload_current_scene()
