# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class UserTest < ActiveSupport::TestCase
  def setup
    @subject = users(:admin)
  end

  test 'user is valid' do
    assert @subject.valid?
  end

  test 'name must be present' do
    subject = User.create(email: 'fake@email.com')

    assert_not subject.valid?
  end
end
