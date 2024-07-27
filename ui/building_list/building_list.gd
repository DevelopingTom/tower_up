extends Control

@export var catalog: Array[Item]

var mapping := []

# Called when the node enters the scene tree for the first time.
func _ready():
	for c in catalog:
		print("adding ", c.item_name)
		$ItemList.add_item(c.item_name, c.icon, true)
		mapping.append(c)
	pass # Replace with function body.

func _on_item_list_item_clicked(index, _at_position, _mouse_button_index):
	var item_instance = mapping[index].building.instantiate()
	item_instance.set_position(get_parent().position)
	get_tree().root.add_child(item_instance)
	hide()
