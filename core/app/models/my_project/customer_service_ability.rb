module MyProject
  class CustomerServiceAbility
    include CanCan::Ability

    def initialize(user)
      if user.respond_to?(:has_spree_role?) && user.has_spree_role?('customer_service')
        can :manage, ::Spree::Order
      end
    end
  end
end
