class CargoCarriage < Carriage
  @@number = 0

  def initialize(capacity)
    @number = @@number += 1
    super(capacity)
  end

  def use_capacity(volume)
    raise "Объёма недостаточно, свободно #{free_capacity}м3" if volume > free_capacity
    super(volume)
  end
end
