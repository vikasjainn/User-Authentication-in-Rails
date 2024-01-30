class AuthenticateUser
    def initialize(app)
      @app = app
    end
  
    def call(env)
      token = env['HTTP_AUTHORIZATION']&.split(' ')&.last
      if token
        begin
          decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base).first
          env['user_id'] = decoded_token['user_id']
        rescue JWT::DecodeError
          return [401, { 'Content-Type' => 'application/json' }, [{ error: 'Invalid token' }.to_json]]
        end
      end
  
      @app.call(env)
    end
  end
  