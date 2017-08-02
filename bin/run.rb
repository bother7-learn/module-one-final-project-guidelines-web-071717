require_relative '../config/environment'
require_relative '../lib/main/Sessions.rb'


  session = Session.new
  session.current_user = session.attempt_login
  loop do
    chosen_zip = session.search_menu
    session.show_trails(chosen_zip)
    session.renew_session
  end
