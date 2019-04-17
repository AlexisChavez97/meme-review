# frozen_string_literal: true

# == Schema Information
#
# Table name: memes
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Meme < ApplicationRecord
  belongs_to :user

  has_many :posts

  has_one_attached :image

  validates :description, :image, presence: true
end
