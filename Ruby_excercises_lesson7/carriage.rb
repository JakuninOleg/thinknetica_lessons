class Carriage
  attr_reader :used_capacity, :free_capacity
  include Company
  include InstanceCounter

  def initialize(capacity)
    @capacity = capacity
    @used_capacity = 0
    @free_capacity = capacity
    register_instance
  end
end
