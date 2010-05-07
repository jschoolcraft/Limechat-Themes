namespace :linkup do
  
  #load the directories
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}")
  Dir.glob("#{File.dirname(__FILE__)}/**/*.css") { |css|   }
  Dir.glob("#{File.dirname(__FILE__)}/**/*.yaml") { |yaml|   }

end

namespace :install do
  
  target = "Library/Application\ Support/LimeChat/"
  files = Dir.glob('*')
#  FileUtils.mkdir target unless Dir.exists? target
  FileUtils.cp_r files, target
  
end