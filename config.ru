require './config/environment'

use Rack::MethodOverride

use UsersController
use EntriesController
use OrganizersController
run ApplicationController