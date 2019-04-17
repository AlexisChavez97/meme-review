# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  user_id    :bigint(8)
#  meme_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostTest < ActiveSupport::TestCase
  def setup
    @subject = posts(:dank_post)
  end

  test 'is valid' do
    assert @subject.valid?
  end

  test 'title can be blank if image is attached' do
    subject = Post.new
    subject.image.attach(io: File.open(file_fixture('joji.jpeg')), filename: 'joji.jpeg')
    subject.meme = memes(:dank_meme)
    subject.user = users(:admin)

    assert subject.valid?
  end

  test 'image can be blank if title is present' do
    subject = Post.new
    subject.title = 'Hello there'
    subject.meme = memes(:dank_meme)
    subject.user = users(:admin)

    assert subject.valid?
  end

  test 'should contain title or image' do
    subject = Post.new
    subject.meme = memes(:dank_meme)
    subject.user = users(:admin)

    assert_not subject.valid?
  end
end
