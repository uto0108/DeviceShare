class Post < ApplicationRecord
  has_one_attached :post_image

  belongs_to :category
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_customers, through: :likes, source: :customer
  has_many :favorites, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
  validates :star, presence: true
  validates :post_image, presence: true


  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

  def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

end