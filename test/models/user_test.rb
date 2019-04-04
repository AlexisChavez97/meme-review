# frozen_string_literal: true

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
