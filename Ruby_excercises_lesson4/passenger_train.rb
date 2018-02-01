class PassengerTrain < Train
  def carriage_add(carriage_type)
    return unless carriage_type.class == PassengerCarriage
    super
  end
end
