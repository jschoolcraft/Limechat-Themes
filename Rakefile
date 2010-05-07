namespace :themes do
  
  desc 'Create symlinks for all of the themes in the current directory'
  task :linkup do
    %x[git submodule init && git submodule update]    
    Dir.glob("#{File.dirname(__FILE__)}/**/*.css") { |css|
        newcss = File.basename(css)
        FileUtils.ln_s css, newcss, :force => true
        }
      Dir.glob("#{File.dirname(__FILE__)}/**/*.yaml") { |yaml|
        newyaml = File.basename(yaml)
        FileUtils.ln_s yaml, newyaml, :force => true
        }
      Dir.glob("#{File.dirname(__FILE__)}/**/*.css") { |js|
        newjs = File.basename(js)
        FileUtils.ln_s js, newjs, :force => true
        }
  end

  desc 'Install into the logged in user\'s limechat directory'
  task :install do
    %x[git submodule init && git submodule update]
    source = Dir.getwd + "/."
    Dir.chdir
    target = Dir.getwd + '/Library/Application Support/LimeChat/Themes/'
    FileUtils.cp_r(source, target, :remove_destination => true)
  end
  
  desc 'Initalize the directory, loading the submodules'
  task :init do
    %x[git submodule init && git submodule update]
  end
  
  desc 'Update the themes directory'
  task :update do
    %x[git pull && git submodule init && git submodule update]
  end
  
end