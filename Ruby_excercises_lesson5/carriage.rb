class Carriage
  include Company
  include InstanceCounter

  def initialize
    register_instance
  end
end
