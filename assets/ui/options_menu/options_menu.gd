extends Control


@onready var master_volume_slider: HSlider = %MasterVolumeSlider
@onready var sfx_volume_slider: HSlider = %SFXVolumeSlider
@onready var music_volume_slider: HSlider = %MusicVolumeSlider


var master_index: int
var sfx_index: int
var music_index: int


func _ready() -> void:
	master_index = AudioServer.get_bus_index("Master")
	sfx_index = AudioServer.get_bus_index("SFX")
	music_index = AudioServer.get_bus_index("Music")
	
	master_volume_slider.value = AudioServer.get_bus_volume_linear(master_index)
	sfx_volume_slider.value = AudioServer.get_bus_volume_linear(sfx_index)
	music_volume_slider.value = AudioServer.get_bus_volume_linear(music_index)


func _on_master_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(master_index, value)


func _on_sfx_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(sfx_index, value)


func _on_music_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(music_index, value)


func _on_button_pressed() -> void:
	visible = false
