class PassengerTrain < Train
  def type
    'Пассажирский'
  end

  def carriage_add
    @carriages << PassengerCarriage.new if speed.zero?
  end
end
