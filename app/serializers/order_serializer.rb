class OrderSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :first, :main, :drink
  belongs_to :user

  def first
    object.load_items
    object.items[0]
  end

  def main
    object.items[1]
  end

  def drink
    object.items[2]
  end

end
