extends Panel

@onready var text = $Text
@onready var next = $Next
@onready var sound = $TextSound
@onready var name_label = $Name
@onready var choices_box = $Choices
@onready var murik = $Murik
@onready var manya = $Manya
@onready var phone = $Phone
@onready var music = $Music

@onready var manya_sound = preload("res://Sounds/manya.wav")
@onready var murik_sound = preload("res://Sounds/murik.wav")

var dialog = [

  { "type": "text", "name": "Мурик", "text": "Эх, вот бы сейчас нормальный корм... Большую пачку! И чтобы надолго.", "sound": "murik", "anim":"Murik_Idle" },
  { "type": "text", "name": "Мурик", "text": "Ого, скидка девяносто процентов? Так вообще бывает?", "sound": "murik", "anim":"phone_up" },
  { "type": "text", "name": "Мурик", "text": "Так… а как это оплатить?", "sound": "murik", "anim":"" },
  { "type": "text", "name": "Маня", "text": "Подожди. Ты правда в это веришь?", "sound": "manya", "anim":"phone_down" },
  { "type": "text", "name": "Мурик", "text": "Ну… там же написано.", "sound": "murik", "anim":"" },
  { "type": "text", "name": "Мурик", "text": "Кстати, а ты кто вообще?", "sound": "murik", "anim":"" },
  { "type": "text", "name": "Маня", "text": "Меня зовут Маня. Я — защитница интернет-пространства.", "sound": "manya", "anim":"manya_speak" },
  { "type": "text", "name": "Мурик", "text": "А я Мурик. Только я не очень понимаю, о чём ты говоришь.", "sound": "murik", "anim":"manya_idle" },
  { "type": "text", "name": "Маня", "text": "Подожди. Ты правда не знаешь, что такое интернет?", "sound": "manya", "anim":"manya_speak" },
  { "type": "text", "name": "Мурик", "text": "Я знаю, что там есть прикольные видео с котами и огурцами!", "sound": "murik", "anim":"manya_idle" },
  { "type": "text", "name": "Маня", "text": "Вот поэтому тебе и нужно узнать правила безопасности в интернете.", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Маня", "text": "Пойдём ко мне. Сейчас всё объясню.", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Мурик", "text": "Ладно… только без сложных слов.", "sound": "murik", "anim":"" },
  { "type": "event", "event": "dialog_ended" }

]

func dialogue_end():
	var tween = create_tween()
	tween.tween_property(music, "volume_db", -40, 0.5)
	await tween.finished
	get_tree().change_scene_to_file("res://scenes/LvViktorina.tscn")

var index = 0
var typing = false
var skip = false

func _ready():
	show_line()


func _input(event):

	if event is InputEventMouseButton and event.pressed:
		if not get_viewport().gui_get_hovered_control():
			next_pressed()

	if event is InputEventScreenTouch and event.pressed:
		next_pressed()


func show_line():

	var line = dialog[index]

	if line["type"] == "text":
		show_text(line)

	if line["type"] == "choice":
		show_choices(line)

	if line["type"] == "jump":
		index = line["goto"]
		show_line()

	if line["type"] == "event":
		run_event(line["event"])


func show_text(line):

	choices_box.visible = false

	name_label.text = line["name"]
	text.text = line["text"]
	text.visible_ratio = 0
	
	if line["anim"] == 'Murik_Idle':
		murik.play("Idle")
	if line["anim"] == 'Murik_Run':
		murik.play("Run")
	if line["anim"] == 'phone_up':
		phone.play("phone_up")
	if line["anim"] == 'phone_down':
		phone.play("phone_down")
	if line["anim"] == 'manya_idle':
		manya.play("Manya_Idle")
	if line["anim"] == 'manya_speak':
		manya.play("Manya_Speak")

	if line["sound"] == "manya":
		sound.stream = manya_sound
	else:
		sound.stream = murik_sound

	skip = false
	typing = true

	while text.visible_ratio < 1:
		if skip:
			text.visible_ratio = 1
			break
  
		text.visible_ratio += 0.03
		sound.play()
		await get_tree().create_timer(0.02).timeout

	typing = false


func show_choices(line):

	name_label.text = ""
	text.text = ""
	choices_box.visible = true

	for child in choices_box.get_children():
		child.queue_free()

	for c in line["choices"]:

		var button = Button.new()
		button.text = c["text"]

		button.pressed.connect(func():
			index = c["goto"]
			choices_box.visible = false
			show_line()
		)

		choices_box.add_child(button)


func next_pressed():

	if typing:
		skip = true
		return
 
	index += 1
 
	if index < dialog.size():
		show_line()
	else:
		hide()


func _on_prev_pressed() -> void:

	if typing:
		skip = true
		return
 
	index -= 1
	index = max(index, 0)

	show_line()


func run_event(event_name):

	if event_name == "start_minigame_1":
		print("Запуск мини-игры 1")
		hide()
	if event_name == "start_minigame_2":
		print("Запуск мини-игры 2")
		hide()
	if event_name == "start_minigame_3":
		print("Запуск мини-игры 3")
		hide()
	if event_name == "murik_run":
		#murik.play("Run")
		#await murik.animation_finished
		next_pressed()
	if event_name == "murik_idle":
		#murik.play("Idle")
		#await murik.animation_finished
		next_pressed()
	if event_name == "dialog_ended":
		dialogue_end()


func _on_next_pressed() -> void:
	next_pressed()
