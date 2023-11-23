extends Node2D

var map
var path = []
var target = null


func _ready():
	call_deferred("setup_nav_server")


func setup_nav_server():
	map = $TileMap.get_navigation_map(0)
	NavigationServer2D.map_set_active(map, true)


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:
			path = NavigationServer2D.map_get_path(map, $Character.position, event.position, true)
			target = path[0]


func _physics_process(delta):
	if target:
		if $Character.position.distance_to(target) < 1:
			path.remove_at(0)
			if path.size() == 0:
				target = null
				$Character.velocity = Vector2.ZERO
			else:
				target = path[0]
				$Character.velocity = $Character.position.direction_to(target)*50
				$Character.move_and_slide()
		else:
			
			$Character.velocity = $Character.position.direction_to(target)*50
			$Character.move_and_slide()

