=======================================================
   0413
   Class Cat
    def self.a
      new.b
      Cat.new.b  #or
      Cat.new.b  # or
      self.new.b  #or

    end

    def b
    end
  end

# ororororoor
把模組當作容器工具用，所以不使用include，把module當作class使用，變成方法的一部分
  module xx
    def self.b
    end
  end

  class Cat 
    def self.a 
      X.b
    end

    def b
      X.b
    end
  end

================================================================
  #  module Encryptor
  # class Hasher
  module Hasher
    require 'digest'
    def self.encrypt(cccc)
      Digest::SHA1.hexdigest(cccc)
    end

    def self.salted(pdddd)
      "123#{pdddd}xx"
    end
  end
放在models外面，此例放在這裡可以
做出CCC.encrypt('123')
不需要先呼叫一個物件出來再呼叫方法

下面再呼叫Hasher↓↓↓↓↓↓↓↓↓↓↓↓↓↓


def self.login(params)
  email = params[:email]
  password = params[:password]

  salted_password = Hasher.salted(password)
  encrypted_password = Hasher.encrypted(salted_password)

  find_by(email: email, password: encrypted_password)
end

private
def encrypt_password
  salted_pwd = Hasher.salted(password)
  self.password = HAsher.encrypt(salted_pwd)
end

# def encrypt(password)
#   Digest::SHA1.hexdigest(password)
# end

# def salted(password)
#   "123#{password}xx"
# end
  ====================================================================


class User < ApplicationRecord
  # attr_writer :password_confirmation
  # validates :email, presence: true, uniqueness: true
  validates :email, presence: true,
                    uniqueness: true, 
                    format: { with: /.+\@.+\..+/ }
  validates :password, presence: true,
                       confirmation: true

before_create :encrypt_password


  # private
  # def encrypt_password
  #   self.password = Digest::SHA1.hexdigest(self.password)
  #   # self.password = Digest::SHA1.hexdigest(password)
  #   # self.password=(Digest::SHA1.hexdigest(password))
  #   # password = Digest::SHA1.hexdigest(password)
  # end

  # def self.login(params)
  #   email = params[:email]
  #   password = params[:password]

  #   encrypted_password = encrypted(salted(password))

  #   find_by(email: email, password: encrypted_password)
  # end
  # def self.login(params)
  #   email = params[:email]
  #   password = params[:password]

  #   salted_password = salted(password)
  #   encrypted_password = encrypted(salted_password)

  #   find_by(email: email, password: encrypted_password)
  # end

  # private
  # def encrypt_password
  #   salted_pwd = salted(password)
  #   self.password = encrypt(salted_pwd)
  #   # self.password = Digest::SHA1.hexdigest(password)
  #   # self.password=(Digest::SHA1.hexdigest(password))
  #   # password = Digest::SHA1.hexdigest(password)
  # end

  # def encrypt(password)
  #   Digest::SHA1.hexdigest(password)
  # end

  # def salted(password)
  #   "123#{password}xx"
  # end


  def self.login(params)
    email = params[:email]
    password = params[:password]

    salted_password = salted(password)
    encrypted_password = encrypted(salted_password)

    find_by(email: email, password: encrypted_password)
  end

  private
  def encrypt_password
    salted_pwd = salted(password)
    self.password = encrypt(salted_pwd)
    # self.password = Digest::SHA1.hexdigest(password)
    # self.password=(Digest::SHA1.hexdigest(password))
    # password = Digest::SHA1.hexdigest(password)
  end

  def encrypt(password)
    Digest::SHA1.hexdigest(password)
  end

  def salted(password)
    "123#{password}xx"
  end

end
