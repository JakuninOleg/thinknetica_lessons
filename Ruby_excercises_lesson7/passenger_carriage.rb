class PassengerCarriage < Carriage
  @@number = 0

  def initialize(capacity)
    @number = @@number += 1
    super(capacity)
  end

  def use_capacity(volume = 1)
    raise 'К сожалению, места в поезде закончились.' if free_capacity.zero?
    super
  end
end
