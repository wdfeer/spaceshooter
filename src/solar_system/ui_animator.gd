extends AnimationPlayer

@onready
var kill_counter: Label = $"../KillCount"
@onready
var kill_counter_text = kill_counter.text

func on_ui_show():
	kill_counter.text = kill_counter_text % UserData.kill_count
