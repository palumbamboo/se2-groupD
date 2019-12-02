class MyFailureApp < Devise::FailureApp

  def redirect_url
    welcome_index_path(notice: 'Invalid email or password')
  end

  def route(scope)
    :welcome_index_url
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end