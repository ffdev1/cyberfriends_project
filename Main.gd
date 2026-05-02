extends Node2D

@onready var btn_ru = $RusLocale
@onready var btn_en = $EngLocale

func set_lang(lang):
	Lang.current_lang = lang
	refresh_ui()


func refresh_ui():
	if Lang.current_lang == "ru":
		
		$Play.texture_normal = preload("res://sprites/Button/PlayNormal.png")
		$Play.texture_pressed = preload("res://sprites/Button/PlayPressed.png")
		$Credits.texture_normal = preload("res://sprites/Button/CreditsNormal.png")
		$Credits.texture_pressed = preload("res://sprites/Button/CreditsPressed.png")
		$Exit.texture_normal = preload("res://sprites/Button/ExitNormal.png")
		$Exit.texture_pressed = preload("res://sprites/Button/ExitPressed.png")
		$Plash1.texture = preload("res://sprites/Name/plash1.png")
		
	else:
		
		$Play.texture_normal = preload("res://sprites/Button/EngPlayNormal.png")
		$Play.texture_pressed = preload("res://sprites/Button/EngPlayPressed.png")
		$Credits.texture_normal = preload("res://sprites/Button/EngCreditsNormal.png")
		$Credits.texture_pressed = preload("res://sprites/Button/EngCreditsPressed.png")
		$Exit.texture_normal = preload("res://sprites/Button/EngQuitNormal.png")
		$Exit.texture_pressed = preload("res://sprites/Button/EngQuitPressed.png")
		$Plash1.texture = preload("res://sprites/Name/plash1_eng.png")
		
		
func _ready() -> void:
	refresh_ui()

func _process(_delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/lvl1.tscn')


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/Credits.tscn')


func _on_rus_locale_pressed() -> void:
	set_lang("ru")

func _on_eng_locale_pressed() -> void:
	set_lang("en")
