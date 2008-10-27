# Installation copied assets into RAILS_ROOT/public/
RAILS_ROOT = File.join(File.dirname(__FILE__), '../../../')

FileUtils.rm(
  File.join(RAILS_ROOT, 'public', 'stylesheets', 'flash_styles.css'),
  :verbose => true
)
FileUtils.rm_r(
  File.join(RAILS_ROOT, 'public', 'images', 'display_flash'),
  :verbose => true
)