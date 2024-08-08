extends Node2D

class_name Building

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("building_clicked", self)

signal building_clicked
