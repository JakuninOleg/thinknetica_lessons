class CargoTrain < Train
  def type
    'Грузовой'
  end

  def carriage_add
   @carriages << CargoCarriage.new if speed.zero?
 end
end
