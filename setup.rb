#!/usr/bin/env ruby
require 'fileutils'

setup = Hash.new
setup = {
  "#{Dir.getwd}/emacs.d"=>"#{ENV["HOME"]}/.emacs.d",
  "#{Dir.getwd}/oh-my-zsh"=>"#{ENV["HOME"]}/.oh-my-zsh",
  "#{Dir.getwd}/zsh/.zshrc"=>"#{ENV["HOME"]}/.zshrc",
  "#{Dir.getwd}/tmux/.tmux.conf"=>"#{ENV["HOME"]}/.tmux.conf",
  "#{Dir.getwd}/vim/.vimrc"=>"#{ENV["HOME"]}/.vimrc",
  "#{Dir.getwd}/sublimetext2/Sublime Text 2"=>"#{ENV["HOME"]}/Library/Application Support/Sublime Text 2" 
}

def link(src,dest)
  FileUtils.rm dest if File.symlink?(dest)

  if File.exists?(dest)
    puts "already exists #{dest}"
  else
    begin
      FileUtils.ln_s src,dest, {:verbose => true}
    rescue Errno
      puts $!
    end
  end
end


setup.each do |src, dest|
  link src,dest
end
puts "Setup done."
