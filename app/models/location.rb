class Location < ActiveRecord::Base
  include Indexable
  include PgSearch

  #pg_search_scope :search, against: [:street_address, :city, :state]
  multisearchable against: [:street_address, :city, :state]

  geocoded_by :address
  after_validation :geocode

  has_many :employees
  accepts_nested_attributes_for :employees, allow_destroy: true, reject_if: ->(emp_attrs) { emp_attrs['name'].blank? }

  after_initialize :add_employee

  def address
    "#{street_address} #{street_address2}, #{city}, #{state} #{zip}, US"
  end

  def name
    address
  end

  private

  def add_employee
    employees.build if employees.empty?
  end

  def update_search_index
    IndexWorker.perform_async(self.id, self.class.name)
  end

end






# using: { tsearch: { prefix: true} }
