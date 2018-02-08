class CargoCarriage < Carriage
  @@number = 0

  def initialize(capacity)
    @number = @@number += 1
    super(capacity)
  end

  def use_capacity(volume)
    message = "Объёма недостаточно, свободно #{free_capacity}м3"
    raise message if volume > free_capacity
    super
  end

  def free_space_info
    info + " Свободное пространство: #{free_capacity}м3. Занято грузом: #{used_capacity}м3"
  end
end
