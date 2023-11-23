extends Node2D

var map
var target = null
var nav

func _ready():
	setup_astar()


func setup_astar():
	nav = AStar2D.new()
	
	for point in $Node.get_children():
		nav.add_point(point.name.to_int(), point.position)
	
	nav.connect_points(1,2)
	nav.connect_points(1,5)
	nav.connect_points(2,3)
	nav.connect_points(2,6)
	nav.connect_points(3,4)
	nav.connect_points(3,7)
	nav.connect_points(4,8)
	
	nav.connect_points(5,6)
	nav.connect_points(6,7)
	nav.connect_points(7,8)
	
	nav.connect_points(9,10)
	nav.connect_points(9,13)
	nav.connect_points(10,11)
	nav.connect_points(10,14)
	nav.connect_points(11,12)
	nav.connect_points(11,15)
	nav.connect_points(12,16)
	
	nav.connect_points(13,14)
	nav.connect_points(14,15)
	nav.connect_points(15,16)
	
	#ladder
	nav.connect_points(6,17)
	nav.connect_points(10,17)


func _input(event):
	if event is InputEventMouseButton:
		print(1)
		if event.button_index == 1 and event.pressed == true:
			print(1)
			var path = nav.get_point_path(1, 15)
			print(path)
			$Line2D.set_points(path)

