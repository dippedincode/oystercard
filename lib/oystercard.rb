class Oystercard
  attr_reader :balance, :entry_station
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
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
    @in_journey
  end

  def touch_in(station)
    if @balance < MINIMUM_BALANCE
      fail "Cannot Travel: Balance too low"
    else
      @in_journey = true
      @entry_station = station
    end
  end

  def touch_out
    @in_journey = false
    deduct(2)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
