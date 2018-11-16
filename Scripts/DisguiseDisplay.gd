extends ItemList

func update_disguises(number):
	clear()
	for i in range(number):
		add_icon_item(load(Global.box_sprite), false)