class Oystercard
  attr_reader :balance, :entry_station, :exit_station
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 2

  def initialize
    @balance = 0
    @entry_station
    @exit_station
  end

  def top_up(amount)
    if @balance + amount > MAXIMUM_BALANCE
      fail "Cannot Top-up: Balance cannot exceed 90" 
    else
      @balance += amount 
    end
  end
  
  def in_journey?
    @entry_station ? true : false
  end

  def touch_in(station)
    if @balance < MINIMUM_BALANCE
      fail "Cannot Travel: Balance too low"
    else
      @entry_station = station
    end
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
    @exit_station = station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
