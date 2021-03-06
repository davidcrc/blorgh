module Blorgh
  class Article < ApplicationRecord
    has_many :comments

    attr_accessor :author_name
    belongs_to :author, class_name: Blorgh.author_class.to_s

    before_validation :set_author

    private
      # Probar esta funcion, como debe llamarse?
      def self.author_class
        @@author_class.constantize
      end

      def set_author
        self.author = Blorgh.author_class.constantize.find_or_create_by(name: author_name)
        # self.author = Blorgh.author_class.find_or_create_by(name: author_name)
      end
  end
end
