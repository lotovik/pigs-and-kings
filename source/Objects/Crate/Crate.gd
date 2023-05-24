extends CharacterBody2D

@export var health = 3
@export var gravity = 2000.0

@onready var animation_player = $AnimationPlayer



func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide()
	if is_on_floor():
		set_physics_process(false)


func _on_hurt_box_2d_hurt(damage):
	health -= damage
	if health < 1:
		animation_player.play("break")
	else:
		animation_player.play("hit")


func _on_crate_checker_area_2d_body_exited(body):
	if body.is_in_group("Crates"):
		set_physics_process(true)
