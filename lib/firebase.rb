# frozen_string_literal: true

class Firebase
  def  initialize(api_key)
    @api_key  = api_key
  end

  def register(params)
    response = HTTParty.post(signup_url,
      headers: {
        'Content-Type': 'application/json'
      },
      body: {
        email: params[:email],
        password: params[:password],
        returnSecureToken: true
      }.to_json
    )

    return [
      200,
      {
        id_token: response['idToken'],
        phone: response['phoneNumber'],
        uid: response['localId']
      }
    ] if response.code == 200

    [400, {}, 'Đăng ký thất bại!']
  end

  def login(params)
    response = HTTParty.post(login_url,
      headers: {
        'Content-Type': 'application/json'
      },
      body: {
        email: params[:email],
        password: params[:password],
        returnSecureToken: true
      }.to_json
    )

    return [
      200,
      {
        id_token: response['idToken'],
        phone: response['phoneNumber'],
        uid: response['localId']
      }
    ] if response.code == 200

    [400, {}, 'Đăng ký thất bại!']
  end

  def verify_phone_number(params)
    response = HTTParty.post(verify_url,
      headers: {
        'Content-Type': 'application/json'
      },
      body: {
        sessionInfo: params[:verification_id],
        code: params[:code]
      }.to_json
    )

    return [
      200,
      {
        id_token: response['idToken'],
        phone: response['phoneNumber'],
        uid: response['localId']
      }
    ] if response.code == 200

    [400, {}, 'Mã xác thực đã hết hạn hoặc không chính xác!']
  end

  def update_password(params)
     response = HTTParty.post(update_passsword_url,
      headers: {
        'Content-Type': 'application/json'
      },
      body: {
        idToken: params[:id_token],
        password: params[:password],
        returnSecureToken: true
      }.to_json
    )

    return [
      200,
      {
        id_token: response['idToken'],
        phone: response['phoneNumber'],
        uid: response['localId']
      }
    ] if response.code == 200

    [400, {}, 'Mã xác thực đã hết hạn hoặc không chính xác!']
  end

  def delete_user(id_token)
    HTTParty.post(delete_url,
      headers: {
        'Content-Type': 'application/json'
      },
      body: {
        idToken: id_token
      }.to_json
    )
  rescue StandardError => e
    puts "Error----------> #{e.message}"
  end

  private

  attr_reader :api_key

  def verify_url
    "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPhoneNumber?key=#{api_key}"
  end

  def firebase_url
    ENV['FIREBASE_VERIFY_URL']
  end

  def signup_url
    "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=#{api_key}"
  end

  def delete_url
    "https://identitytoolkit.googleapis.com/v1/accounts:delete?key=#{api_key}"
  end

  def update_passsword_url
    "https://identitytoolkit.googleapis.com/v1/accounts:update?key=#{api_key}"
  end

  def login_url
    "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=#{api_key}"
  end
end