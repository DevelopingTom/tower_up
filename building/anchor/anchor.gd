extends Node2D

class_name Anchor

signal anchor_clicked(anchor: Anchor)

func _ready():
	connect("anchor_clicked", WorldGlobals.on_anchor_clicked)
	WorldGlobals.connect("anchor_clicked", on_anchor_clicked)

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("anchor_clicked", self)
			$BuildingList.show()

func _on_area_2d_area_entered(_area):
	print("entered")
	hide()

func _on_area_2d_area_exited(_area):
	show()

func on_anchor_clicked(anchor: Anchor):
	if anchor != self:
		$BuildingList.hide()
