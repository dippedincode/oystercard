class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    if @balance + amount > 90
      fail "Cannot Top-up: Balance cannot exceed 90" 
    else
      @balance += amount 
    end
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

end
