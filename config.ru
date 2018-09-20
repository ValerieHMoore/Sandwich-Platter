require './config/environment'

use Rack::MethodOverride
use UsersController
use SandwichesController
run ApplicationController
