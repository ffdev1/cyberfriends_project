extends Panel

@onready var text = $Text
@onready var next = $Next
@onready var sound = $TextSound
@onready var name_label = $Name
@onready var choices_box = $Choices
@onready var manya = $Manya
@onready var virus = $Virus
@onready var virus2 = $Virus2
@onready var music = $Music

@onready var manya_sound = preload("res://Sounds/manya.wav")
@onready var murik_sound = preload("res://Sounds/murik.wav")

var dialog = [

  { "type": "text", "name": "Маня", "text": "Мурик, сейчас я расскажу тебе о правилах поведения в интернете.", "sound": "manya", "anim":"manya_speak" },
  { "type": "text", "name": "Мурик", "text": "Хорошо!", "sound": "murik", "anim":"manya_idle" },
  { "type": "text", "name": "Маня", "text": "Тогда начнём.", "sound": "manya", "anim":"manya_speak" },
  { "type": "text", "name": "Маня", "text": "Сейчас появляется всё больше мессенджеров и способов общаться в сети.", "sound": "manya", "anim":"ms_pop_out" },
  { "type": "text", "name": "Маня", "text": "Какой бы свободой ты там ни чувствовал себя, всё равно нужно соблюдать правила. Так ты защитишь себя и свои данные.", "sound": "manya", "anim":"ms_pop_in" },
  #Общение в сети
  { "type": "text", "name": "Маня", "text": "В первую очередь надо быть вежливым в сети.", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Маня", "text": "На грубость не стоит отвечать грубостью.", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Маня", "text": "Если собеседник ведёт себя враждебно, лучше пожаловаться на него, а не спорить.", "sound": "manya", "anim":"" },
  #Личные данные
  { "type": "text", "name": "Маня", "text": "Когда общаешься в интернете, никогда не говори незнакомым людям личную информацию.", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Маня", "text": "И не выкладывай в соцсети то, что может поставить тебя в опасность.", "sound": "manya", "anim":"" },
  #Источники
  { "type": "text", "name": "Маня", "text": "Ещё важно не скачивать приложения из ненадёжных источников, например с торрент-сайтов.", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Маня", "text": "В таких приложениях может быть вредоносная программа — вирус.", "sound": "manya", "anim":"Virus_pop_out" },
  { "type": "text", "name": "Маня", "text": "Вирусы бывают разные, а самые опасные из них могут собирать информацию с заражённого устройства.", "sound": "manya", "anim":"Virus_pop_in" },
  #Игра
  { "type": "text", "name": "Мурик", "text": "Ого, Маня, как интересно!", "sound": "murik", "anim":"manya_idle" },
  { "type": "text", "name": "Маня", "text": "Да, Мурик, это не только интересно, но и очень важно!", "sound": "manya", "anim":"manya_speak" },
  { "type": "text", "name": "Маня", "text": "Чтобы ты всё запомнил, я задам тебе пару вопросов.", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Маня", "text": "Не бойся ошибиться! Я подскажу, где ты ошибся.", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Маня", "text": "Готов?", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Мурик", "text": "Готов!", "sound": "murik", "anim":"manya_idle" },
  
  { "type": "text", "name": "Маня", "text": "Тебе позвонили, представились банком и просят назвать код из СМС.", "sound": "manya", "anim":"manya_speak" },
  { "type": "text", "name": "Маня", "text": "Что ты сделаешь?", "sound": "manya", "anim":"" },
  
  { "type": "choice",
	"choices": [
	  { "text": "Назову код.", "goto": 22 },
	  { "text": "Ничего не отвечу и сброшу звонок.", "goto": 25 }
	]
  }, #21
  
  { "type": "text", "name": "Маня", "text": "Неверно. Сотрудники банка никогда не спрашивают код из СМС.", "sound": "manya", "anim":"Cross_out" },
  { "type": "text", "name": "Маня", "text": "Его просят мошенники, чтобы получить доступ к твоему аккаунту.", "sound": "manya", "anim":"" },
  
  { "type": "jump", "goto": 27 },
  
  { "type": "text", "name": "Маня", "text": "Верно. Сотрудники банка никогда не спрашивают код из СМС.", "sound": "manya", "anim":"Check_out" },
  { "type": "text", "name": "Маня", "text": "Его просят мошенники, чтобы получить доступ к твоему аккаунту.", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Маня", "text": "Во время общения на форуме ты замечаешь пользователя, который ведёт себя плохо.", "sound": "manya", "anim":"Check_in" },
  { "type": "text", "name": "Маня", "text": "Вдруг он начинает тебя оскорблять.", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Маня", "text": "Что ты сделаешь?", "sound": "manya", "anim":"" },
  
  { "type": "choice",
	"choices": [
	  { "text": "Отправлю на него жалобу.", "goto": 31 },
	  { "text": "Тоже начну его оскорблять.", "goto": 33 }
	]
  }, #30
  
  { "type": "text", "name": "Маня", "text": "Верно. Благодаря жалобе модераторы могут заметить нарушителя и наказать его.", "sound": "manya", "anim":"Check_out" },
  
  { "type": "jump", "goto": 34 },
  
  { "type": "text", "name": "Маня", "text": "Неверно. Так ты ничего не добьёшься и только испортишь ситуацию.", "sound": "manya", "anim":"Cross_out" },
  
  { "type": "text", "name": "Маня", "text": "Ты собираешься ехать с классом в поездку.", "sound": "manya", "anim":"Check_in" },
  { "type": "text", "name": "Маня", "text": "Ты хочешь написать об этом пост в соцсетях.", "sound": "manya", "anim":"" },
  { "type": "text", "name": "Маня", "text": "Что ты в нём напишешь?", "sound": "manya", "anim":"" },
  
	{ "type": "choice",
	"choices": [
	  { "text": "Информацию о полёте, документах и так далее.", "goto": 38 },
	  { "text": "О своих впечатлениях от поездки.", "goto": 41 }
	]
  }, #37
  
  { "type": "text", "name": "Маня", "text": "Неверно. Эту информацию ни в коем случае нельзя публиковать.", "sound": "manya", "anim":"Cross_out" },
  { "type": "text", "name": "Маня", "text": "Злоумышленники могут воспользоваться ею в своих целях.", "sound": "manya", "anim":"" },
  
  { "type": "jump", "goto": 43 },
  
  { "type": "text", "name": "Маня", "text": "Конечно! Информацию о поездке не стоит выкладывать в открытый доступ.", "sound": "manya", "anim":"Check_out" },
  { "type": "text", "name": "Маня", "text": "Злоумышленники могут воспользоваться ею в своих целях.", "sound": "manya", "anim":"" },
  
  #Конец
  { "type": "text", "name": "Маня", "text": "Мурик, ты большой молодец!", "sound": "manya", "anim":"Check_in" },
  { "type": "text", "name": "Мурик", "text": "Спасибо, Маня. Благодаря тебе я узнал столько нового!", "sound": "murik", "anim":"manya_idle" },
  { "type": "text", "name": "Мурик", "text": "Теперь я смогу заказать корм и не попасться на обман.", "sound": "murik", "anim":"" },
  { "type": "text", "name": "Маня", "text": "Не только корм, но и игрушки.", "sound": "manya", "anim":"manya_speak" },
  { "type": "text", "name": "Мурик", "text": "Правда? А поможешь мне выбрать?", "sound": "murik", "anim":"manya_idle" },
  { "type": "text", "name": "Маня", "text": "Конечно, помогу. А какие тебе нравятся?", "sound": "manya", "anim":"manya_speak" },
  { "type": "event", "event": "dialog_ended" }

]

func dialogue_end():
	var tween = create_tween()
	tween.tween_property(music, "volume_db", -40, 0.5)
	await tween.finished
	get_tree().change_scene_to_file("res://scenes/TheEnd.tscn")

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
	
	if line["anim"] == 'Virus_pop_out':
		virus.play("pop out")
		virus2.play("pop out")
	if line["anim"] == 'Virus_pop_in':
		virus.play("pop in")
		virus2.play("pop in")
	if line["anim"] == 'Check_out':
		virus.play("check_out")
		virus2.play("check_out")
	if line["anim"] == 'Check_in':
		virus.play("check_in")
		virus2.play("check_in")
	if line["anim"] == 'Cross_out':
		virus.play("cross_out")
		virus2.play("cross_out")
	if line["anim"] == 'Cross_in':
		virus.play("cross_in")
		virus2.play("cross_in")
	if line["anim"] == 'Virus_stay':
		virus.play("stay")
		virus2.play("stay")
	if line["anim"] == 'ms_pop_out':
		virus.play("vk pop out")
		virus2.play("max pop out")
	if line["anim"] == 'ms_pop_in':
		virus.play("vk pop in")
		virus2.play("max pop in")
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
