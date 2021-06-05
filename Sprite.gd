extends Sprite

var positions = []
var index = 0

func _ready():
	for node in get_parent().get_children():
		if node is Label and node.visible:
			print(node.name, node.rect_position.x)
			positions.append(node)
	set_selection(0)

func set_selection(new_index):
	if new_index >= 0 and new_index < len(positions):
		index = new_index
		var selected_node = positions[index]
	
		position = Vector2(
			selected_node.rect_position.x - (get_rect().size.x * scale.x) / 2 - 10,
			selected_node.rect_position.y + selected_node.rect_size.y/2
		)
	else:
		print("Error")

func _process(delta):
	var action = positions[index]
	if Input.is_action_just_pressed("ui_up"):
		if index == 0:
			$sound.play()
			set_selection(len(positions) - 1)
		else:
			$sound.play()
			set_selection(index - 1)
	if Input.is_action_just_pressed("ui_down"):
		if index == len(positions) - 1:
			$sound.play()
			set_selection(0)
		else:
			$sound.play()
			set_selection(index + 1)
	if Input.is_action_just_pressed("ui_accept"):
		$sound.play()
		action.callback()
