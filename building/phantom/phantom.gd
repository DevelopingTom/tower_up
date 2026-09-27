extends Node2D

@export var texture: Texture2D
@export var collision_shape: CollisionShape2D
@export var parent_area: Area2D

func init(sprite: Sprite2D, shape: CollisionShape2D, area: Area2D):
	$Sprite2D.texture = sprite.texture
	$Sprite2D.offset = sprite.offset
	parent_area = area
	collision_shape = shape

var query : PhysicsShapeQueryParameters2D
var shape_rid: RID
func _physics_process(_delta):
	if $AnimationPlayer.is_playing():
		return
	
	if not query:
		shape_rid = PhysicsServer2D.rectangle_shape_create()
		PhysicsServer2D.shape_set_data(shape_rid, collision_shape.shape.size / 2)
		query = PhysicsShapeQueryParameters2D.new()
		query.shape_rid = shape_rid
		query.collide_with_areas = true
		query.collide_with_bodies = false
		query.collision_mask = 1 # building layer
		query.transform.origin = collision_shape.global_position

	var space_state = get_world_2d().direct_space_state
	var collisions = space_state.intersect_shape(query)
	PhysicsServer2D.free_rid(shape_rid)
	var collided_building := false
	for c in collisions:
		if c.collider != parent_area:
			collided_building = true
			break

	if collided_building:
		print("cannot build")
		$AnimationPlayer.play("disappear")
	else:
		$AnimationPlayer.play("disappear_ok")

signal construction_possible
