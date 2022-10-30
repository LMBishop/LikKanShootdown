extends Label

var coins = 0

func _on_coin_hit():
	coins += 1
	self.text = str(coins)
