require "rails_admin_acts_as_list/version"
require "rails_admin_acts_as_list/engine"
require "rails_admin"

module RailsAdminActsAsList
  class ActsAsListAction < RailsAdmin::Config::Actions::Base
    register_instance_option :member do
      true
    end

    register_instance_option :visible? do
      bindings[:controller].action_name == "index" && bindings[:object].is_a?(ActiveRecord::Acts::List::InstanceMethods)
    end
  end

  class MoveLower < ActsAsListAction
    RailsAdmin::Config::Actions.register(self)

    def visible?
      super and !bindings[:object].last?
    end

    register_instance_option :controller do
      proc do
        @object.move_lower
        redirect_to back_or_index, flash: { success: "Moved item lower to position #{@object.position}" }
      end
    end

    register_instance_option :link_icon do
      'fas fa-angle-down'
    end
  end

  class MoveHigher < ActsAsListAction
    RailsAdmin::Config::Actions.register(self)

    def visible?
      super and !bindings[:object].first?
    end

    register_instance_option :controller do
      proc do
        @object.move_higher
        redirect_to back_or_index, flash: { success: "Moved item higher to position #{@object.position}" }
      end
    end

    register_instance_option :link_icon do
      'fas fa-angle-up'
    end
  end

  class MoveToBottom < ActsAsListAction
    RailsAdmin::Config::Actions.register(self)

    def visible?
      super and bindings[:object].lower_items(2)&.count == 2
    end

    register_instance_option :controller do
      proc do
        @object.move_to_bottom
        redirect_to back_or_index, flash: { success: "Moved item higher to the bottom" }
      end
    end

    register_instance_option :link_icon do
      'fas fa-angle-double-down'
    end
  end

  class MoveToTop < ActsAsListAction
    RailsAdmin::Config::Actions.register(self)

    def visible?
      super and bindings[:object].higher_items(2)&.count == 2
    end

    register_instance_option :controller do
      proc do
        @object.move_to_top
        redirect_to back_or_index, flash: { success: "Moved item higher to the top" }
      end
    end

    register_instance_option :link_icon do
      'fas fa-angle-double-up'
    end
  end
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class ActsAsList < Base
        RailsAdmin::Config::Actions.register(RailsAdminActsAsList::MoveLower)
        RailsAdmin::Config::Actions.register(RailsAdminActsAsList::MoveHigher)
        RailsAdmin::Config::Actions.register(RailsAdminActsAsList::MoveToTop)
        RailsAdmin::Config::Actions.register(RailsAdminActsAsList::MoveToBottom)

        register_instance_option :object_level do
          true
        end
      end
    end
  end
end
