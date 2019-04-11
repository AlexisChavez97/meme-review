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


class Meme < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :caption, presence: true, unless: Proc.new { |meme| meme.image.attached? }
  validates :image, presence: true, if: Proc.new { |meme| meme.caption.blank? }
end
