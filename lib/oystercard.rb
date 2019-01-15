class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
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
  end

end
