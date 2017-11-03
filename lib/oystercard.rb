class Oystercard
LIMIT = 90
MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey

  def initialize(balance = 0)
    @balance = balance
  #  @entry_station = nil
  #  @exit_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise error_top_up if @balance + amount > LIMIT
    @balance += amount
  end

  def error_top_up
    "You are exceeding the limit in your card. You can top_up only #{LIMIT - @balance}"
  end

  def touch_in(station)
    raise 'Insufficient balance for travel' if @balance < MINIMUM_FARE
    @journey = Journey.new.start_journey(station)
  end

  def touch_out(station)
    deduct #if @entry_station != nil
  #  @exit_station = station
    @journey.end_journey(station)
    #@journeys << [{entry: @entry_station}, {exit: @exit_station}]
  end

  def in_journey?
     @journey.entry_station != nil
  end

  private

  def deduct
    @balance -= MINIMUM_FARE
  end
end
