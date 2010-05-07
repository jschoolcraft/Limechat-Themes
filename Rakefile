namespace :themes do
  
  #TODO : make this crap acutally work
  desc 'Create symlinks for all of the themes in the current directory'
  task :linkup do
    #load the directories
   # path = unshift("#{File.dirname(__FILE__)}")
   # Dir.glob("#{File.dirname(__FILE__)}/**/*.css") { 
   #   |css| 
   #     FileUtils.ln_s css css   
   #        }
   # Dir.glob("#{File.dirname(__FILE__)}/**/*.yaml") { |yaml|   }
   puts "todo: make this work!"
  end

  #TODO : make this crap acutally work  
  desc 'Install into the logged in user\'s limechat directory'
    task :install do
      source = Dir.getwd + "/."
      Dir.chdir
      target = Dir.getwd + '/Library/Application Support/LimeChat/Themes/'
      FileUtils.cp_r(source, target, :remove_destination => true)
  end
  
end