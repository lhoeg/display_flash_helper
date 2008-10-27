module DisplayFlashHelper
  # global options for displaying flash messages
  @@flash_options = {
    :flash_types    => [:error, :warning, :notice],
    :error_class    => 'error',
    :warning_class  => 'warning',
    :notice_class   => 'notice',
    :info_class     => 'info',
    :flash_id       => 'flash'
  }
  mattr_accessor :flash_types

  def display_flash
    messages = ((@@flash_options[:flash_types] & flash.keys).collect do |key|
      content_tag(:div, flash[key], :class => @@flash_options["#{key}_class".to_sym])
    end.join("\n"))

    if messages.size > 0
      content_tag(:div, messages, :id => @@flash_options[:flash_id])
    else
      ""
    end
  end
end