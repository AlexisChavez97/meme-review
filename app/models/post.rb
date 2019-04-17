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


class Post < ApplicationRecord
  belongs_to :user
  belongs_to :meme

  has_one_attached :image

  validates :title, presence: true, unless: Proc.new { |post| post.image.attached? }
  validates :image, presence: true, if: Proc.new { |post| post.title.blank? }
end
