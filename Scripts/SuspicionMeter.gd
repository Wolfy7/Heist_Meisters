extends TextureProgress

var suspicion = 0

export var suspicion_step = 1 #How much suspicion goes up every time we're seen
export var suspicion_dropoff = 0.25 #How fas suspicion falls

func _process(delta):
	suspicion -= suspicion_dropoff
	suspicion = clamp(suspicion, min_value, max_value)
	value = suspicion

func player_seen():
	if suspicion == max_value:
		end_game()
	suspicion += suspicion_step
		
		
func end_game():
	get_tree().change_scene("res://Scenes/GameOverScreen.tscn")