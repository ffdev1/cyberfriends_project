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

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Мурик, сейчас я расскажу тебе правила поведения в интернете.","en":"Muffin, I’m going to teach you how to stay safe online."},"sound":"manya","anim":"manya_speak"},

{ "type": "text","name":{"ru":"Мурик","en":"Muffin"},"text":{"ru":"Хорошо!","en":"Okay!"},"sound":"murik","anim":"manya_idle"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Тогда начнём.","en":"Let’s begin."},"sound":"manya","anim":"manya_speak"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Сейчас появляется всё больше способов общаться в интернете.","en":"There are more and more ways to communicate online."},"sound":"manya","anim":"ms_pop_out"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Но даже там важно соблюдать правила — так ты защитишь себя и свои данные.","en":"But even there, you need to follow rules to stay safe and protect your data."},"sound":"manya","anim":"ms_pop_in"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"В интернете важно быть вежливым.","en":"It’s important to be polite online."},"sound":"manya","anim":""},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Не отвечай грубостью на грубость.","en":"Don’t answer mean words with more mean words."},"sound":"manya","anim":""},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Лучше пожаловаться, чем спорить.","en":"It’s better to report than to argue."},"sound":"manya","anim":""},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Никогда не делись личной информацией с незнакомцами.","en":"Never share personal information with strangers."},"sound":"manya","anim":""},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"И не публикуй то, что может поставить тебя в опасность.","en":"And don’t post anything that could put you in danger."},"sound":"manya","anim":""},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Не скачивай приложения из ненадёжных источников.","en":"Don’t download apps from unsafe sources."},"sound":"manya","anim":""},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"В них могут быть вирусы.","en":"They might contain viruses."},"sound":"manya","anim":"Virus_pop_out"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Некоторые вирусы могут красть данные.","en":"Some viruses can steal your data."},"sound":"manya","anim":"Virus_pop_in"},

{ "type": "text","name":{"ru":"Мурик","en":"Muffin"},"text":{"ru":"Ого, как интересно!","en":"Wow, that’s interesting!"},"sound":"murik","anim":"manya_idle"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Это не только интересно, но и важно.","en":"It’s not just interesting — it’s important."},"sound":"manya","anim":"manya_speak"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Давай проверим, что ты запомнил.","en":"Let’s check what you’ve learned."},"sound":"manya","anim":""},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Не бойся ошибиться — я подскажу.","en":"Don’t worry if you make mistakes — I’ll help you."},"sound":"manya","anim":""},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Готов?","en":"Ready?"},"sound":"manya","anim":""},

{ "type": "text","name":{"ru":"Мурик","en":"Muffin"},"text":{"ru":"Готов!","en":"Ready!"},"sound":"murik","anim":"manya_idle"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Тебе звонят и просят назвать код из СМС.","en":"Someone calls you and asks for your SMS code."},"sound":"manya","anim":"manya_speak"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Что ты сделаешь?","en":"What do you do?"},"sound":"manya","anim":""},

{ "type": "choice",
 "choices":[
  { "text":{"ru":"Назову код.","en":"Tell them the code."}, "goto": 22 },
  { "text":{"ru":"Сброшу звонок.","en":"Hang up."}, "goto": 25 }
 ]
},
{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Неверно. Сотрудники банка никогда не спрашивают код из СМС.","en":"Wrong. Real bank workers never ask for your code."},"sound":"manya","anim":"Cross_out"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Это делают мошенники, чтобы получить доступ к аккаунту.","en":"Scammers do that to get access to your account."},"sound":"manya","anim":""},

{ "type":"jump","goto":27},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Верно!","en":"Correct!"},"sound":"manya","anim":"Check_out"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Это мошенники, которые хотят получить доступ к аккаунту.","en":"Those are scammers trying to access your account."},"sound":"manya","anim":""},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"На форуме кто-то начинает тебя оскорблять.","en":"Someone on a forum starts insulting you."},"sound":"manya","anim":"Check_in"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Что ты сделаешь?","en":"What do you do?"},"sound":"manya","anim":""},

{ "type": "choice",
 "choices":[
  { "text":{"ru":"Пожалуюсь на него.","en":"Report them."}, "goto": 30 },
  { "text":{"ru":"Оскорблю в ответ.","en":"Insult them back."}, "goto": 32 }
 ]
},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Верно. Модераторы смогут заметить нарушителя.","en":"Correct. Moderators can deal with them."},"sound":"manya","anim":"Check_out"},

{ "type":"jump","goto":33},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Неверно. Это только ухудшит ситуацию.","en":"Wrong. That only makes things worse."},"sound":"manya","anim":"Cross_out"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Ты собираешься в поездку и хочешь написать об этом пост.","en":"You’re going on a trip and want to post about it."},"sound":"manya","anim":"Check_in"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Что ты напишешь?","en":"What do you post?"},"sound":"manya","anim":""},

{ "type": "choice",
 "choices":[
  { "text":{"ru":"Подробности поездки и документы.","en":"Trip details and documents."}, "goto": 36 },
  { "text":{"ru":"Свои впечатления.","en":"Your impressions."}, "goto": 39 }
 ]
},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Неверно. Эту информацию нельзя публиковать.","en":"Wrong. That information should stay private."},"sound":"manya","anim":"Cross_out"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Ею могут воспользоваться злоумышленники.","en":"Someone could misuse it."},"sound":"manya","anim":""},

{ "type":"jump","goto":41},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Верно!","en":"Correct!"},"sound":"manya","anim":"Check_out"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Личную информацию лучше не выкладывать.","en":"It’s safer not to share personal details."},"sound":"manya","anim":""},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Мурик, ты отлично справился!","en":"Muffin, you did great!"},"sound":"manya","anim":"Check_in"},

{ "type": "text","name":{"ru":"Мурик","en":"Muffin"},"text":{"ru":"Спасибо, Маня! Теперь я понимаю, как себя вести.","en":"Thanks, Maya! Now I know what to do."},"sound":"murik","anim":"manya_idle"},

{ "type": "text","name":{"ru":"Мурик","en":"Muffin"},"text":{"ru":"И смогу купить корм безопасно.","en":"And I can buy food safely now."},"sound":"murik","anim":""},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"И не только корм.","en":"And not just food."},"sound":"manya","anim":"manya_speak"},

{ "type": "text","name":{"ru":"Мурик","en":"Muffin"},"text":{"ru":"Правда?","en":"Really?"},"sound":"murik","anim":"manya_idle"},

{ "type": "text","name":{"ru":"Маня","en":"Maya"},"text":{"ru":"Конечно. Главное — думать перед тем, как нажимать.","en":"Of course. Just remember: think before you click."},"sound":"manya","anim":"manya_speak"},

{ "type": "event","event":"dialog_ended"}

]

var index = 0
var typing = false
var skip = false
var input_locked = false

func _ready():
 show_line()

func _input(event):
 if event is InputEventMouseButton and event.pressed:
  if not get_viewport().gui_get_hovered_control():
   next_pressed()

 if event is InputEventScreenTouch and event.pressed:
  next_pressed()

# ================= CORE =================

func show_line():

 if index < 0 or index >= dialog.size():
  return

 var line = dialog[index]

 match line["type"]:

  "text":
   show_text(line)

  "choice":
   show_choices(line)

  "jump":
   index = line["goto"]
   show_line()

  "event":
   run_event(line["event"])

# ================= TEXT =================

func show_text(line):

 input_locked = false
 choices_box.visible = false

 name_label.text = line["name"][Lang.current_lang]
 text.text = line["text"][Lang.current_lang]
 text.visible_ratio = 0

 play_anim(line["anim"])
 play_sound(line["sound"])

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

# ================= CHOICES =================

func show_choices(line):

 input_locked = true

 name_label.text = ""
 text.text = ""
 choices_box.visible = true

 for child in choices_box.get_children():
  child.queue_free()

 for c in line["choices"]:

  var button = Button.new()
  button.text = c["text"][Lang.current_lang]

  button.pressed.connect(func():
   index = c["goto"]
   choices_box.visible = false
   input_locked = false
   show_line()
  )

  choices_box.add_child(button)

# ================= INPUT =================

func next_pressed():

 if typing:
  skip = true
  return

 if input_locked:
  return

 index += 1
 show_line()

func _on_prev_pressed():

 if typing:
  skip = true
  return

 index -= 1
 index = max(index, 0)

 show_line()

# ================= EVENTS =================

func run_event(event_name):

 match event_name:

  "dialog_ended":
   dialogue_end()

  _:
   print("Event:", event_name)

func dialogue_end():
 var tween = create_tween()
 tween.tween_property(music, "volume_db", -40, 0.5)
 await tween.finished
 get_tree().change_scene_to_file("res://scenes/Credits.tscn")

# ================= HELPERS =================

func play_sound(s):

 if s == "manya":
  sound.stream = manya_sound
 else:
  sound.stream = murik_sound

func play_anim(anim):

 match anim:

  "Virus_pop_out":
   virus.play("pop out")
   virus2.play("pop out")

  "Virus_pop_in":
   virus.play("pop in")
   virus2.play("pop in")

  "Check_out":
   virus.play("check_out")
   virus2.play("check_out")

  "Check_in":
   virus.play("check_in")
   virus2.play("check_in")

  "Cross_out":
   virus.play("cross_out")
   virus2.play("cross_out")

  "Cross_in":
   virus.play("cross_in")
   virus2.play("cross_in")

  "ms_pop_out":
   virus.play("vk pop out")
   virus2.play("max pop out")

  "ms_pop_in":
   virus.play("vk pop in")
   virus2.play("max pop in")

  "manya_idle":
   manya.play("Manya_Idle")

  "manya_speak":
   manya.play("Manya_Speak")
