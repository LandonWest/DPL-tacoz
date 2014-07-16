class Location < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search, against: [:street_address, :city, :state, :zip], associated_against: { employees: [:name, :badge_number] }

  geocoded_by :address
  after_validation :geocode
  has_many :employees

  accepts_nested_attributes_for :employees, allow_destroy: true, reject_if: :has_blank_attributes

  def address
    "#{street_address} #{street_address2}, #{city}, #{state} #{zip}, US"
  end

  private

  def has_blank_attributes(employee_attrs)
    employee_attrs['name'].blank?
  end

end
