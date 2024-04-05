extends CharacterBody2D


func _ready():
	Node.PROCESS_MODE_DISABLED

	
func show_chicken():
	if Global.gunEvent:
		Node.PROCESS_MODE_INHERIT

