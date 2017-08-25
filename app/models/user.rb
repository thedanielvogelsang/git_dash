class User < ApplicationRecord
  validates_presence_of :uid,
                        :username,
                        :token
end
