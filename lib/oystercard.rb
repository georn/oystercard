class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journey_list

  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station
    @exit_station
    @journey_list = []
  end

  def top_up(amount)
    raise "Maximum balance of £#{BALANCE_LIMIT} exceeded" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    raise "Balance below minimum." if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    log_journey
    reset_stations
  end

  private

  def log_journey
    journey_list.push({entry: entry_station, exit: exit_station})
  end


  def deduct(amount)
    @balance -= amount
  end

  def reset_stations
    @entry_station = nil
    @exit_station = nil
  end
end
