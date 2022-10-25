module MyProject
  module Spree
    module AbilityDecorator
      def abilities_to_register
        [CustomerServiceAbility]
      end
    end
  end
end

::Spree::Ability.prepend(MyProject::Spree::AbilityDecorator)
