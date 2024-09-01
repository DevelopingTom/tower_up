extends Node

var catalog: Array[Item]

func _ready():
	var starting_catalog = load("res://ui/building_list/catalog/starting_catalog.tres")
	catalog = starting_catalog.catalog.duplicate()

func current_catalog():
	return catalog

func add_item_to_catalog(item: Item):
	catalog.push_back(item)
