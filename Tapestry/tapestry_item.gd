class_name Tapestry_Item
extends Resource

@export var name: String
@export var currTexture: Texture
@export var DAY: Texture
@export var NIGHT: Texture
@export var WINDY: Texture
@export var THUNDER: Texture

func setTexture(setting: EnumStorage.Settings):
	var replaceText = get(EnumStorage.get_setting(setting))
	currTexture = replaceText
