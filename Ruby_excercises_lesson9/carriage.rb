class Carriage
  attr_reader :used_capacity, :number
  include Company
  include InstanceCounter

  def initialize(capacity)
    @capacity = capacity
    @used_capacity = 0
    register_instance
  end

  def free_capacity
    @capacity - @used_capacity
  end

  def use_capacity(volume)
    @used_capacity += volume unless @used_capacity == @capacity
  end

  def info
    "#{self.class} номер #{number}."
  end
end
