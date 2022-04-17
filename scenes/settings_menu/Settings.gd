extends Node

onready var sound = $CanvasLayer/VBoxContainer/SoundVolume/Sound
onready var music = $CanvasLayer/VBoxContainer/MusicVolume/Music
onready var main = $CanvasLayer/VBoxContainer/MainVolume/Main
onready var font = $CanvasLayer/VBoxContainer/Font/Font
onready var font_size = $CanvasLayer/VBoxContainer/FontSize/FontSize

onready var max_bones = $CanvasLayer/VBoxContainer2/MaxBones/MaxBones




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_Main_value_changed(value: float) -> void:
	Settings.main_volume = value
	SoundEngine.play_sound("UIClick")


func _on_Sound_value_changed(value: float) -> void:
	Settings.sound_volume = value
	SoundEngine.play_sound("UIClick")


func _on_Music_value_changed(value: float) -> void:
	Settings.music_volume = value


#func _on_Close_pressed() -> void:
#	SceneLoader.goto_scene("res://scenes/title_screen/TitleScreen.tscn")


func _on_Button_pressed() -> void:
	SoundEngine.play_sound("UIClick")


func _on_Button_mouse_entered() -> void:
	SoundEngine.play_sound("UIHover")


func _on_Delete_Savegame_pressed() -> void:
	#SaveGame.reset()
	pass


func _on_Font_item_selected(index: int) -> void:
	var new_font = $CanvasLayer/VBoxContainer/Font/Font.get_item_text(index)
	Settings.font = new_font


func _on_FontSize_value_changed(value: float) -> void:
	Settings.font_size = value


func _ready() -> void:
	sound.value = Settings.sound_volume
	music.value = Settings.music_volume
	main.value = Settings.main_volume
	
	for i in range(font.get_item_count()):
		if font.get_item_text(i) == Settings.font:
			font.select(i)
			break
			
	font_size.value = Settings.font_size
	
	max_bones.value = Settings.max_bones


func _on_SettingsMenu_popup_hide() -> void:
	Settings.persist_data()


func _on_MaxBones_value_changed(value: float) -> void:
	Settings.max_bones = value
	$Skeleton.die()
