extends Node2D

class_name Place

@onready var char:Sprite2D = get_node("ChosenCharacter")
@export var place_given: Tapestry_Item
@export var setting_given: EnumStorage.Settings
var charLoaded:String
signal open_tap
signal give_item
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_char(charChosen: String):
	char.texture = load("res://Characters/"+charChosen+".png")
	charLoaded = charChosen

func talk_to():
	var dialog = Dialogic.start(charLoaded.to_lower())
