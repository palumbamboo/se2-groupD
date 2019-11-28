class Student < ApplicationRecord
  attribute :name
  attribute :surname
  attribute :fiscal_code
  attribute :birth_date, type: Date
  attribute :enrollment_date, type: Date

  has_and_belongs_to_many :parents
  has_many :marks
  belongs_to :school_class, default: -> { SchoolClass.find_or_create_by(section: '0', number: 0) }

  def to_s
    "#{name.capitalize} #{surname.capitalize}"
  end

  def birth_date
    super.is_a?(String) ? super.to_date : super
  end

  def enrollment_date
    super.is_a?(String) ? super.to_date : super
  end

  def first_parent_name
    (parents.present? && parents.first.present?) ? parents.first.name : nil
  end

  def first_parent_surname
    (parents.present? && parents.first.present?) ? parents.first.surname : nil
  end

  def first_parent_email
    (parents.present? && parents.first.present?) ? parents.first.user.email : nil
  end

  def second_parent_name
    (parents.present? && parents.second.present?) ? parents.second.name : nil
  end

  def second_parent_surname
    (parents.present? && parents.second.present?) ? parents.second.name : nil
  end

  def second_parent_email
    (parents.present? && parents.second.present?) ? parents.second.user.email : nil
  end
end