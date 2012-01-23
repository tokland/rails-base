class SessionsController < Clearance::SessionsController
  def url_after_destroy
    root_path
  end
  
  def show
    redirect_to new_session_path
  end
end
