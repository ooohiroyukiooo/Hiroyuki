# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Article < ActiveRecord::Base

  validates :name, :title, presence: true
  validates :name, length: { maximum: 20 }
  validates :content, length: { maximum: 10 }
  
end

