require_relative 'router'
require_relative 'controller'
require_relative 'view'

controller = Controller.new

router = Router.new(controller)

router.run
