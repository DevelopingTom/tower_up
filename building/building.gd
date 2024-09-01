extends Node2D

class_name Building

func _ready():
	$Sprite2D.visible = true
	# can't be done statically: each building instance has a different texture
	$Phantom.init($Sprite2D, $Area2D/CollisionShape2D.shape, $Area2D)

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("building_clicked", self)

func _on_phantom_construction_possible(possible: bool):
	if not possible:
		queue_free()
	else:
		$Sprite2D.visible = true
		$Phantom.queue_free()

signal building_clicked
