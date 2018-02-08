class PassengerCarriage < Carriage
  @@number = 0

  def initialize(capacity)
    @number = @@number += 1
    super(capacity)
  end

  def use_capacity(volume = 1)
    message = 'К сожалению, места в поезде закончились.'
    raise message if free_capacity.zero?
    super
  end

  def free_space_info
    info + " Свободные места: #{free_capacity}. Занято мест: #{used_capacity}"
  end
end
