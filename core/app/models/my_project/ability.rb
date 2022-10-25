module MyProject
  class Ability < ::Spree::Ability
    def initialize(user)
      alias_cancan_delete_action

      user ||= ::Spree::User.new
      # user ||= Spree.user_class.new

      if user.respond_to?(:has_spree_role?) && user.has_spree_role?('admin')
        apply_admin_permissions(user)
        # add some more permissions here for the admin role
      else
        if user.respond_to?(:has_spree_role?) && user.has_spree_role?(:customer_service)
          apply_customer_service_permissions(user)
        end

        apply_user_permissions(user)
      end

      protect_admin_role
    end

    protected

    def apply_customer_service_permissions(user)
      puts "customer service permissions"
      # can :manage, :all
      # can :read, ::Spree::Order
      # a
      can :read, ::Spree::Taxonomy
      # can [:create, :update, :destroy, :show, :read], ::Spree::Taxonomy
      # can :manage, ::Spree::Taxonomy
    end
  end
end
