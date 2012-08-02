#!/usr/bin/env ruby
require 'fileutils'

# def link(src,dir,:option=false)
#   FileUtils.ln_s "#{Dir.getwd}/emacs.d","#{ENV["HOME"]}/.emacs.d"  if symlink(dir
# end

FileUtils.ln_sf "#{Dir.getwd}/emacs.d","#{ENV["HOME"]}/.emacs.d" 


