require "blorgh/version"
require "blorgh/engine"

module Blorgh
  mattr_accessor :author_class
  extend ActiveSupport::Concern
  
  def self.hola
    ArticlesController.testing_controller
    
    return "Hola mundo!!!"
  end
end
