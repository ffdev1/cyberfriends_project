extends Node2D

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene.tscn")

func _ready() -> void:
	refresh_ui()

func refresh_ui():
	if Lang.current_lang == "ru":
		$NameCredits.texture = preload("res://sprites/Name/NameCredits.png")
		$bg/Label.text = "Программирование, логика и диалоговая система:
Алексей Тананин
Дизайн, персонажи и анимации:
Яков Колесников

Спасибо за прохождение
и внимание к теме цифровой безопасности!"
	else:
		$NameCredits.texture = preload("res://sprites/Name/NameCredits_eng.png")
		$bg/Label.text = "Programming, logic, and dialogue system:
Alexey Tananin
Design, characters, and animations:
Yakov Kolesnikov

Thank you for playing
and for your attention to digital safety!"
