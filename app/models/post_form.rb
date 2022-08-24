class PostForm
  include ActiveModel::Model


  attr_accessor( 
    :text, :image,
    :id, :created_at, :datetime, :updated_at, :datetime,
    :tag_name
  )

  with_options presence: true do
    validates :text
    validates :image
  end

  def save
    post = Post.create(text: text, image: image)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end

  def update(params, post)
    post.update(params)
  end
end