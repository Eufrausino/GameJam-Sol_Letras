extends CharacterBody2D

# Configurações de movimento
@export var speed: float = 200.0  # Velocidade de movimento horizontal
@export var jump_force: float = 400.0  # Força do pulo
@export var gravity: float = 900.0  # Gravidade aplicada ao personagem

# Variáveis internas
var animated_sprite: AnimatedSprite2D

func _ready() -> void:
	# Referência ao nó AnimatedSprite2D
	if has_node("AnimatedSprite2D"):
		animated_sprite = $AnimatedSprite2D
	else:
		push_error("AnimatedSprite2D não encontrado na cena.")

func _physics_process(delta: float) -> void:
	# Aplicar gravidade
	velocity.y += gravity * delta

	# Movimento horizontal
	var input_direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = input_direction * speed
	  
	# Atualizar animação para movimento horizontal
	if input_direction != 0:
		animated_sprite.play("correr")
		animated_sprite.flip_h = input_direction < 0  # Inverte o sprite se estiver indo para a esquerda
	else:
		animated_sprite.play("parada")

	# Pulo
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):  # 'ui_accept' é geralmente espaço ou Enter
			velocity.y = -jump_force
			animated_sprite.play("pular")
	else:
		# Alternar entre animação de pulo e queda
		if velocity.y < 0:
			animated_sprite.play("pular")  # Subindo
		else:
			animated_sprite.play("cair")  # Caindo

	# Aplicar movimento
	move_and_slide()
