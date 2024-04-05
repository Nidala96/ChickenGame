extends Node

var num_players = 8
var bus = "master"

var available = []  # The available players.
var queue = []  # The queue of sounds to play.
var player = AudioStreamPlayer.new()

func _ready():
		add_child(player)
		
func stop():
	player.stop()

func play(sound_path):
	player.stream = load(sound_path)
	player.play()


