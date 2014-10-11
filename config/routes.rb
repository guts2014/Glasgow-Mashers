Rails.application.routes.draw do
  # Changes url/users/sign_in to url/sign_in
  devise_for :user, :path => "/", path_names: { 
    sign_in: 'login', 
    sign_out: 'logout',
    sign_up: 'sign_up' 
  }

  authenticated :user do 
    root 'logged_in#user_log_in', as: :authenticated_root, via: :get
  end

  unauthenticated :user do
    root 'static_pages#welcome_page'
  end

end
