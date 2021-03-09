class Api::SessionsController < ApplicationController
    include JwtAuthenticator
    

  def login
      @user = User.find_by(email: session_params[:email])

      if @user && @user.authenticate(session_params[:password])
          login!
        jwt_token = encode(@user.id)
        response.headers['X-Authentication-Token'] = jwt_token
          render json: { logged_in: true, user: @user, token: jwt_token}
      else
        raise UnableAuthorizationError.new("ログインIDまたはパスワードが誤っています。")
        #   render json: { status: 401, errors: ['認証に失敗しました。', '正しいメールアドレス・パスワードを入力し直すか、新規登録を行ってください。'] }
      end
  end

  def logout
      reset_session
      render json: { status: 200, logged_out: true }
  end

  def logged_in?
      if @current_user
          render json: { logged_in: true, user: current_user }
      else
          render json: { logged_in: false, message: 'ユーザーが存在しません' }
      end
  end

  def create
    # ログインIDを元にユーザーを取得
    @current_user = User.find_by(sign_in_id: params[:sign_in_id])
    # パスワードによる認証
    if @current_user&.authenticate(params[:password])
      # jwtの発行
      jwt_token = encode(@current_user.id)
      # レスポンスヘッダーにトークンを設定
      response.headers['X-Authentication-Token'] = jwt_token
      # 任意のレスポンスを返す
      render json: @current_user
    else
      raise UnableAuthorizationError.new("ログインIDまたはパスワードが誤っています。") 
    end
  end

  private

      def session_params
          params.require(:user).permit(:username, :email, :password)
      end

end