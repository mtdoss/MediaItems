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

require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
