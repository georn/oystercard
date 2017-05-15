class Oystercard

  attr_reader :balance, :in_use

  BALANCE_LIMIT = 90

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise "Maximum balance of £#{BALANCE_LIMIT} exceeded" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_use ? true : false
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

end
