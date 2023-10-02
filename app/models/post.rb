# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  expires_on :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#
class Post < ApplicationRecord
  belongs_to(:board)
  scope(:active, -> { where("expires_on >= ?", Date.today) })
  scope(:expired, -> { where("expires_on < ?", Date.today) })
  validates(:body, { :presence => true })
end
