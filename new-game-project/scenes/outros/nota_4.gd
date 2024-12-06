extends AnimatableBody2D


@onready var lyra = $"../Lyra"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:		
	print(self.is_visible_in_tree())

	if (lyra.venceu == true):
		self.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
