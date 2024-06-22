extends Node

enum Settings {
	day,
	night,
	windy,
	thunder,
}

func get_setting(setting: Settings) -> String:
	match setting:
		Settings.day:
			return "DAY"
		Settings.night:
			return "NIGHT"
		Settings.windy:
			return "WINDY"
		Settings.thunder:
			return "THUNDER"
	return ""

func get_enum(setting: String) -> Settings:
	match setting:
		"DAY":
			return Settings.day
		"NIGHT":
			return Settings.night
		"WINDY":
			return Settings.windy
		"THUNDER":
			return Settings.thunder
	return Settings.day
