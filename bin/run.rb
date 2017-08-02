require_relative '../config/environment'
require_relative '../lib/Sessions.rb'


  session = Session.new
  session.current_user = session.attempt_login
  session.park_or_trail?
  session.search
  session.searc_menu
