class BuildOrder < ApplicationRecord
  belongs_to :user
  has_many :build_order_steps, dependent: :destroy
  accepts_nested_attributes_for :build_order_steps,
    reject_if: :all_blank, allow_destroy: true
  validates :name, :faction, presence: true

  def self.search(user, params)
    params[:query].blank? ? user.build_orders.all : user.build_orders.where(
      "name LIKE ?", "%#{sanitize_sql_like(params[:query])}%"
    )
  end
end
