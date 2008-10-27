namespace :display_flash do

  desc "If the installation didn't copy the files correctly, use this task"
  task :setup do
    plugin_dir = File.join(File.dirname(__FILE__), '..')
    FileUtils.cp_r( 
      Dir[File.join(plugin_dir, 'public')], 
      File.join(RAILS_ROOT),
      :verbose => true
    )
    puts "Finished."
  end

  desc "Remove images and style"
  task :clean do
    FileUtils.rm(
      File.join(RAILS_ROOT, 'public', 'stylesheets', 'flash_styles.css'),
      :verbose => true
    )
    FileUtils.rm_r(
      File.join(RAILS_ROOT, 'public', 'images', 'display_flash'),
      :verbose => true
    )
    puts "Finished."
  end
end