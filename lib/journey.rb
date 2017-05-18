class Journey
  attr_reader :from_station, :to_station

  # def initialize
  #   @from_station
  #   @to_station
  # end
  MINIMUM_FARE = 1
  PENALTY_FARE  = 6

  def start_journey(station)
    # station
    @from_station = station
  end

  def finish_journey(station)
    # station
    @to_station = station
  end

  def fare
    incompleted_journey? ? PENALTY_FARE : MINIMUM_FARE
  end

  private

  def incompleted_journey?
    from_station == nil || to_station == nil 
  end
end
