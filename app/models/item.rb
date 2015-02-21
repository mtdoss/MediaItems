# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string           not null
#  ttype      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :user_id
  )
end
