class Oystercard
  attr_reader :balance, :entry_station
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @entry_station
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

  def touch_out
    deduct(2)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
