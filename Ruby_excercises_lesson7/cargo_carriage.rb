class CargoCarriage < Carriage
  @number = 0

  def use_capacity(volume)
    raise "Объёма недостаточно, свободно #{@free_capacity}м3" if volume > @free_capacity
    @free_capacity -= volume unless @free_capacity.zero?
    @used_capacity += volume unless @used_capacity == @capacity
  end

  def self.number
    @number += 1
  end
end
