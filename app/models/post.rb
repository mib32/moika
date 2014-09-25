class Post < ActiveRecord::Base
  include Bootsy::Container
  self.inheritance_column =   :sti_type
  belongs_to :user
  default_scope -> {order('created_at desc')}
end
