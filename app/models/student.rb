class Student < ApplicationRecord
  attribute :name
  attribute :surname
  attribute :fiscal_code
  attribute :birth_date, type: Date
  attribute :enrollment_date, type: Date

  has_and_belongs_to_many :parents
  has_many :marks
  belongs_to :school_class, default: -> { SchoolClass.find_or_create_by(section: '0', number: 0) }

  validates :name, :surname, presence: true, format: { with: /\A[a-zA-Z'-]*\z/, message: 'No special characters, only letters' }
  validates :enrollment_date, presence: true, inclusion: { in: FIRST_ACADEMIC_YEAR..END_OF_THE_YEAR, message: "Enrollment date must be between first year #{FIRST_ACADEMIC_YEAR.year} and #{END_OF_THE_YEAR.year}" }
  validates :fiscal_code, presence: true, format: { with: /\A[\w]*\z/, message: 'No special characters, only letters and numbers' }
  validates :birth_date, :school_class_id, presence: true


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