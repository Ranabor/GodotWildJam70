class_name Tapestry_List

var unlocked_places: Array[Tapestry_Item] = []

var unlocked_settings: Array[EnumStorage.Settings] = []

func unlock_place(item: Tapestry_Item):
	if item in unlocked_places:
		return
	unlocked_places.append(item)

func unlock_setting(setting: EnumStorage.Settings):
	if setting in unlocked_settings:
		return
	unlocked_settings.append(setting)
