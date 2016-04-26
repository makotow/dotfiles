#!/usr/bin/env ruby
require 'fileutils'

setup = Hash.new
setup = {
  "#{Dir.getwd}/emacs.d"=>"#{ENV["HOME"]}/.emacs.d",
  "#{Dir.getwd}/tmux/.tmux.conf"=>"#{ENV["HOME"]}/.tmux.conf",
  "#{Dir.getwd}/vim/dot.vimrc"=>"#{ENV["HOME"]}/.vimrc",
  "#{Dir.getwd}/vim/dot.vim"=>"#{ENV["HOME"]}/.vim",
  "#{Dir.getwd}/git/gitconfig"=>"#{ENV["HOME"]}/.gitconfig",
  "#{Dir.getwd}/atom"=>"#{ENV["HOME"]}/.atom",
  "#{Dir.getwd}/peco"=>"#{ENV["HOME"]}/.peco",
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
