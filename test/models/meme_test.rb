# frozen_string_literal: true

# == Schema Information
#
# Table name: memes
#
#  id         :bigint(8)        not null, primary key
#  users_id   :bigint(8)
#  caption    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MemeTest < ActiveSupport::TestCase
  def setup
    @subject = Meme.new
    @subject.user = users(:admin)
  end

  test 'can attach image to meme' do
    @subject.caption = 'meme review'
    @subject.image.attach(io: File.open(file_fixture('joji.jpeg')), filename: 'joji.jpeg')

    assert @subject.image.attached?

    assert @subject.save
  end
end
