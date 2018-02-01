class CargoTrain < Train
  def carriage_add(carriage_type)
    return unless carriage_type.class == CargoCarriage
    super
  end
end
