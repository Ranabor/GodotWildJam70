extends Place


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	open_tap.emit()


func _on_given_pressed():
	give_item.emit()


func _on_chosen_character_talk():
	talk_to()
