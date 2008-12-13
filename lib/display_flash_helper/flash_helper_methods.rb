# Helper methods for default flash messages in controllers;
#
# You may exchange the default scaffold controller's (NoteController)
#   flash[:notice] = 'Note was successfully created.'
# with
#   flash_created(@note)
# and
#   flash[:notice] = 'Note was successfully updated.'
# with
#   flash_updated(@object)
# to provide default (internationalized) messages.
#
# In addition to the above there are also helper methods for create and update failures.
module DisplayFlashHelper
  module FlashHelperMethods

    def flash_created(object)
      flash[:notice] = I18n.t :created,
        :obj => human_name(object), :scope => :display_flash_helper,
        :default => "{{obj}} was successfully created."
    end

    def flash_create_failed(object)
      flash[:error] = I18n.t :create_failed,
        :obj => human_name(object), :scope => :display_flash_helper,
        :default => "{{obj}} could not be created."
    end

    def flash_updated(object, name=nil)
      obj_name = human_name(object)
      obj_name << " '#{name.to_s}'" if name
      flash[:notice] = I18n.t :updated,
        :obj => obj_name, :scope => :display_flash_helper,
        :default => "{{obj}} was successfully updated."
    end

    def flash_update_failed(object)
      flash[:error] = I18n.t :update_failed,
        :obj => human_name(object), :scope => :display_flash_helper,
        :default => "{{obj}} could not be updated."
    end

    protected

      def human_name(object)
        if object.is_a? Class
          object.human_name
        #elsif object.is_a? String
          # TODO
        #elsif object.is_a? Symbol
          # TODO
        else
          #I18n.t object.class.name.underscore.to_sym, :default => object.class.name, :scope => [:activerecord, :models]
          object.class.human_name
        end
      end

  end
end