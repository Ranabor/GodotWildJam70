extends Node2D

@export var place_node: Node2D
const WHITE = "ffffff"
const NIGHT = "364363"

var place: Tapestry_Item
var setting: EnumStorage.Settings

var tapestryVector: Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	tapestryVector = %Tapestry.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_tapestry_nextrun():
	place = %Tapestry.current_place
	setting = %Tapestry.current_setting
	if (setting == EnumStorage.Settings.night || setting == EnumStorage.Settings.thunder):
		%CanvasModulate.color = NIGHT
	else:
		%CanvasModulate.color = WHITE
	place_node.hide()
	%Tapestry.position = Vector2(2000, 2000)
	place_node = get_node(place.name)
	if (%Tapestry.charChosen != ""):
		place_node.update_char(%Tapestry.charChosen)
	place_node.show()

func open_tap():
	%Tapestry.position = tapestryVector


func _on_olympia_open_tap():
	open_tap()

func _on_theater_open_tap():
	open_tap()


func _on_spring_open_tap():
	open_tap()

func _on_temple_open_tap():
	open_tap()

func _on_olympia_give_item():
	if (setting == EnumStorage.Settings.night):
		%Tapestry.unlock_place(%Olympia.place_given)
	elif (setting == EnumStorage.Settings.day):
		%Tapestry.unlock_setting(%Olympia.setting_given)
	elif (setting == EnumStorage.Settings.thunder):
		%Tapestry.unlock_char("Zeus")
	elif (setting == EnumStorage.Settings.windy):
		%Tapestry.unlock_char("Demeter")


func _on_theater_give_item():
	if (setting == EnumStorage.Settings.thunder):
		%Tapestry.unlock_place(%Theater.place_given)
	elif (setting == EnumStorage.Settings.day):
		%Tapestry.unlock_char("Dionysus")
	elif (setting == EnumStorage.Settings.night):
		%Tapestry.unlock_char("Erigone")
	elif (setting == EnumStorage.Settings.windy):
		pass

func _on_spring_give_item():
	if (setting == EnumStorage.Settings.night):
		%Tapestry.unlock_place(%Spring.setting_given)
	elif (setting == EnumStorage.Settings.day):
		%Tapestry.unlock_char("Issa")
	elif (setting == EnumStorage.Settings.windy):
		%Tapestry.unlock_char("Poseidon")
	elif (setting == EnumStorage.Settings.thunder):
		pass


func _on_temple_give_item():
	if (setting == EnumStorage.Settings.day):
		%Tapestry.unlock_place(%Temple.place_given)
	elif (setting == EnumStorage.Settings.thunder):
		%Tapestry.unlock_setting(%Temple.setting_given)
	elif (setting == EnumStorage.Settings.night):
		%Tapestry.unlock_char("Apollo")
	elif (setting == EnumStorage.Settings.windy):
		%Tapestry.unlock_char("Europa")
