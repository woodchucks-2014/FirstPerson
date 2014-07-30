class Notification < ActiveRecord::Base
  belongs_to :user

  def to_js
    {title: self.title, content: self.content}
  end
end