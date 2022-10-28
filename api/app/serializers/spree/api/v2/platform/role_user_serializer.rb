module Spree
  module Api
    module V2
      module Platform
        class RoleUserSerializer < BaseSerializer
          set_type :role_user

          attributes :id, :role_id, :user_id, :role

          has_one :role,
                  record_type: :role,
                  serializer: :role
        end
      end
    end
  end
end
