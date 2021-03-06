extends "res://settings/PersistentProperties.gd"



var font: String setget _set_font, _get_font
var font_size: int setget _set_font_size, _get_font_size

var main_volume: float = 0.75 setget _set_main_volume
var sound_volume: float = 0.75 setget _set_sound_volume
var music_volume: float = 0.75 setget _set_music_volume

var max_bones: float = 128


func _init():
	# override filename
	filepath = 'user://settings.json'


# set soundeffect volume on AudioServer
func _set_sound_volume(new_value: float) -> void:
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("Sound"),
		linear2db(new_value)
	)
	sound_volume = new_value

# set music volume on AudioServer
func _set_music_volume(new_value: float) -> void:
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("Music"), 
		linear2db(new_value)
	)
	music_volume = new_value

# set master volume on AudioServer
func _set_main_volume(new_value: float) -> void:
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("Master"), 
		linear2db(new_value)
	)
	main_volume = new_value

func _set_font(new_font: String) -> void:
	var default_font := preload("res://default_theme.tres").default_font as DynamicFont
	default_font.set_deferred("font_data", load("res://fonts/" + new_font + ".ttf"))
	
	#font = new_font
func _get_font() -> String:
	var default_font := preload("res://default_theme.tres").default_font as DynamicFont
	var font_path := default_font.font_data.font_path
	return font_path.get_file().trim_suffix("." + font_path.get_extension())


func _set_font_size(new_size: int) -> void:
	var default_font := preload("res://default_theme.tres").default_font as DynamicFont
	default_font.set_deferred("size", new_size)


func _get_font_size() -> int:
	var default_font := preload("res://default_theme.tres").default_font as DynamicFont
	return default_font.size

