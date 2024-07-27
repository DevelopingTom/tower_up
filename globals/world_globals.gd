extends Node

@export var tile_size := Vector2i(16, 16)

func on_anchor_clicked(anchor: Anchor):
	emit_signal("anchor_clicked", anchor)

signal anchor_clicked(anchor: Anchor)
