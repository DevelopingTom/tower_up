extends Node2D

@export var texture: Texture2D
@export var collision_shape: RectangleShape2D
@export var parent_area: Area2D
@onready var foo = $ColorRect

func init(sprite: Sprite2D, shape: RectangleShape2D, area: Area2D):
	$Sprite2D.texture = sprite.texture
	$Sprite2D.offset = sprite.offset
	foo.custom_minimum_size = shape.size
	foo.global_position = area.global_position
	parent_area = area
	collision_shape = shape

var query : PhysicsShapeQueryParameters2D
var shape_rid: RID
func _physics_process(_delta):
	if $AnimationPlayer.is_playing():
		return
	
	if not query:
		shape_rid = PhysicsServer2D.rectangle_shape_create()
		PhysicsServer2D.shape_set_data(shape_rid, collision_shape.size / 2)
		query = PhysicsShapeQueryParameters2D.new()
		query.shape_rid = shape_rid
		query.collide_with_areas = true
		query.collide_with_bodies = false
		query.collision_mask = 1 # building layer
		query.transform.origin = parent_area.global_position

	var space_state = get_world_2d().direct_space_state
	var collisions = space_state.intersect_shape(query)
	PhysicsServer2D.free_rid(shape_rid)
	print("parent area: ", parent_area.get_parent())
	var collided_building := false
	for c in collisions:
		if c.collider != parent_area:
			print("colliding with: ", c.collider.get_parent())
			collided_building = true
			break

	if collided_building:
		print("cannot build")
		$AnimationPlayer.play("disappear")
	else:
		$AnimationPlayer.play("disappear_ok")

signal construction_possible
