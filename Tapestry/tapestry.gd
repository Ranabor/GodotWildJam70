extends Control

@export var starting_items: Array[Tapestry_Item]
var current_place: Tapestry_Item
var tl = Tapestry_List.new()
var current_setting
var charChosen: String = ""
signal close
var charUnlocked: Array[String] = ["1","2","3","1","1","1","1","1"]

signal nextrun

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in starting_items:
		tl.unlock_place(item)
		%PlaceButton.add_item(item.name)
	tl.unlock_setting(EnumStorage.Settings.day)
	#tl.unlock_setting(EnumStorage.Settings.thunder)
	current_setting = tl.unlocked_settings[0]
	current_place = tl.unlocked_places[0]
	tl.unlocked_places[0].setTexture(current_setting)
	%Place.texture = tl.unlocked_places[0].currTexture
	%PlaceButton.select(0)
	%SettingButton.add_item(EnumStorage.get_setting(tl.unlocked_settings[0]))
	#%SettingButton.add_item(EnumStorage.get_setting(tl.unlocked_settings[1]))

func unlock_place(given: Tapestry_Item):
	if given in tl.unlocked_places:
		return
	tl.unlock_place(given)
	%PlaceButton.add_item(given.name)
	
func unlock_setting(given: EnumStorage.Settings):
	if given in tl.unlocked_settings:
		return
	tl.unlock_setting(given)
	%SettingButton.add_item(EnumStorage.get_setting(given))

func unlock_char(given: String):
	if (given in charUnlocked):
		return
	charUnlocked.append(given)
	if (charChosen == ""):
		charChosen = given
	%CharButton.show()
	%CharButton.add_item(given)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_place_button_item_selected(index):
	var selected_place = %PlaceButton.get_item_text(index)
	for item in tl.unlocked_places:
		if item.name == selected_place:
			current_place = item
			update_bg()

func update_bg():
	current_place.setTexture(current_setting)
	%Place.texture = current_place.currTexture

func _on_setting_button_item_selected(index):
	var selected_setting = EnumStorage.get_enum(%SettingButton.get_item_text(index))
	for item in tl.unlocked_settings:
		if item == selected_setting:
			current_setting = item
			update_bg()


func _on_submit_pressed():
	nextrun.emit()
	%Close.show()


func _on_close_pressed():
	close.emit()


func _on_char_button_item_selected(index):
	charChosen = %CharButton.get_item_text(index)
