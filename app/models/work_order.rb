class WorkOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :project_type
  belongs_to :status
  belongs_to :labels
  belongs_to :contact
  belongs_to :processor, class_name: 'User'
  has_one :rep, through: :client, class_name: 'User'
  has_one :presort_information
  has_one :printing_instructions
  has_one :production_details
  validates_presence_of :client_id
  validates_presence_of :dueDate
  validates_presence_of :number
  validates_presence_of :project_type_id
  validates_presence_of :monthlySequenceNumber
  validates_presence_of :status_id
  validates_format_of :number, with: /(?:00[1-9]|0[1-9]\d|[1-9]\d\d)\d{2}(?:0[1-9]|1[0-2])-(?:00[1-9]|0[1-9]\d|[1-9]\d\d)/
  validates_format_of :monthlySequenceNumber,
                      with: /(?:00[1-9]|0[1-9]\d|[1-9]\d\d)/
  validates :printing_instructions, presence: true, if: :printing_componant?, on: :create
  validates :presort_information, presence: true, if: :mailing_componant?, on: :create
  accepts_nested_attributes_for :presort_information,
                                :printing_instructions,
                                :production_details

  before_validation :set_monthly_sequence_number,
                    :set_workorder_number,
                    on: :create,
                    unless: @number

  def set_workorder_number
    set_monthly_sequence_number
    self.number = "#{ client.clientnumber }#{ month_and_year_string }-#{ monthlySequenceNumber }" if client
  end

  def display_number
    number[0..2] + '-' + number[5..6] + '-' + number[-3, 3]
  end

  def display_date
    dueDate.strftime('%D')
  end
  
  def self.schedule
     WorkOrder.joins(:status).where.not(statuses: { description: ['Delete', 'Mailed']}).order(:dueDate)
  end

  def active?
    if status.description == 'Active'
      true
    else
      false
    end
  end
  
  def in_house?
    if status.description == 'Active' || status.description == 'Completed' || status.description == 'On Hold'
      true
    else
      false
    end
  end
  def mailing_componant?
    project_type.mailing if project_type
  end

  def printing_componant?
    project_type.printing if project_type
  end

  private

    def set_monthly_sequence_number
      self.monthlySequenceNumber = next_sequence_number
    end

    def created_this_month
      WorkOrder.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).count
    end

    def next_sequence_number
      '%03d' % (created_this_month + 1)
    end

    def month_and_year_string
      "#{Date.today.year.to_s[-2, 2]}#{'%02d' % Date.today.month.to_s}"
    end
end
