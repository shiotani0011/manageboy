module JwtAuthenticator
  require "jwt"

  SECRET_KEY = Rails.application.secrets.secret_key_base
  # SECRET_KEY = Rails.application.credentials[:secret_key_base]


  # ヘッダーの認証トークンを復号化してユーザー認証を行う
  def jwt_authenticate
    # トークンが空の場合はエラーを拾う
    raise UnableAuthorizationError if request.headers['Authorization'].blank?

    encoded_token = request.headers['Authorization'].split('Bearer ').last
    # トークンを復号化する(トークンが復号できない場合、有効期限切れの場合はここで例外が発生します。)
    payload = decode(encoded_token)
    # Payloadから取得したユーザーIDでログインしているユーザー情報を取得
    @current_user = User.find(payload["user_id"])

    # 無効なトークンもエラーを拾う
    raise UnableAuthorizationError if @current_user.blank?
    @current_user
  rescue # UnableAuthorizationError
    # 拾ったエラーは401にする
    response_unauthorized
  end

  # 暗号化処理
  def encode(user_id)
    expires_in = 1.month.from_now.to_i # 再ログインを必要とするまでの期間を１ヶ月とした場合
    preload = { user_id: user_id, exp: expires_in }
    JWT.encode(preload, SECRET_KEY, 'HS256')
  end

  # 復号化処理
  def decode(encoded_token)
    decoded_dwt = JWT.decode(encoded_token, SECRET_KEY, true, algorithm: 'HS256')
    decoded_dwt.first
  end

end