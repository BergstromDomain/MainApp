class Person < ApplicationRecord
    validates :first_name, :last_name, :main_image, :thumb_image, presence: true

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= "http://placeimg.com/600/400/nature"
        self.thumb_image ||= "http://placeimg.com/350/200/nature"
    end
end
