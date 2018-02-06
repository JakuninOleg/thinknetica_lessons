class PassengerCarriage < Carriage
  @number = 0

  def take_a_seat
    raise 'К сожалению, места в поезде закончились.' if @free_capacity.zero?
    @free_capacity -= 1
    @used_capacity += 1 unless @used_capacity == @capacity
  end

  def self.number
    @number += 1
  end
end
