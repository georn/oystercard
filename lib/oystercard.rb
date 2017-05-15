class Oystercard
  
  attr_reader :balance

  BALANCE_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance of £#{BALANCE_LIMIT} exceeded" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
