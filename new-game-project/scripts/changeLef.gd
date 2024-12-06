extends Area2D


func _on_body_entered(body: Node2D) -> void:

	if (body.name == 'Lyra'):
		get_tree().change_scene_to_file("res://scenes/lab2.tscn")
