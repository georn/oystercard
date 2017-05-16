require 'oystercard'

card = Oystercard.new

card.top_up(5)

p card.balance

card.touch_in

card.touch_out

p card.balance #=> 4
