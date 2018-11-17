extends CanvasModulate

const DARK = Color("03081c")
const NIGHTVISION = Color("2bc92b")

func _ready():
	add_to_group("interface")
	color = DARK
	get_tree().call_group("labels", "hide")


func NightVision_mode():
	inform_npcs("NightVision_mode")
	color = NIGHTVISION
	$AudioStreamPlayer2D.stream = load(Global.nightvision_on_sfx)
	play_sfx()
	get_tree().call_group("labels", "show")
	
func DarkVision_mode():
	inform_npcs("DarkVision_mode")
	color = DARK
	$AudioStreamPlayer2D.stream = load(Global.nightvision_off_sfx)
	play_sfx()
	get_tree().call_group("labels", "hide")

func play_sfx():
	$AudioStreamPlayer2D.play()
	
func inform_npcs(vision_mode):
	get_tree().call_group("npc", vision_mode)