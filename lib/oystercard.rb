
require 'journey'
class Oystercard
LIMIT = 90
MINIMUM_FARE = 1
  attr_accessor :balance, :journey_history, :journey

  def initialize(balance = 0)
    @balance = balance
    @journey_history = []
    @journey = Journey.new
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
    @journey.start_journey(station)
  end

  def touch_out(station)
    @journey.end_journey(station)
    add_journey
    deduct
  end

  def add_journey
    @journey_history << @journey.current_journey
  end

  def in_journey?
     @journey.entry_station != nil
  end

  private

  def deduct
    @balance -= @journey.fare
  end
end
