class WorkOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :project_type
  belongs_to :status
  belongs_to :labels
  has_one :presort_information
  has_one :printing_instructions
  has_one :production_details
  validates_presence_of :client_id
  validates_presence_of :dueDate
  validates_presence_of :number
  validates_presence_of :project_type_id
  validates_presence_of :monthlySequenceNumber
  validates_presence_of :status_id
  validates_format_of :number,  with: /(?:00[1-9]|0[1-9]\d|[1-9]\d\d)\d{2}(?:0[1-9]|1[0-2])-(?:00[1-9]|0[1-9]\d|[1-9]\d\d)/
  validates_format_of :monthlySequenceNumber, with: /(?:00[1-9]|0[1-9]\d|[1-9]\d\d)/
  validates :printing_instructions, presence: true, if: :has_printing_componant?
  validates :presort_information, presence: true, if: :has_mailing_componant?
  
  
  before_validation :set_monthly_sequence_number, :set_workorder_number, on: :create, unless: @number
  
  def self.schedule
    WorkOrder.joins(:status).where(statuses: {description: "Active"}).order(:dueDate)
  end
  
  def active?
    if self.status.description == "Active"
      true
    else
      false
    end
  end
  
  def has_mailing_componant?
    project_type.mailing if project_type
  end
  
  def has_printing_componant?
    project_type.printing if project_type
  end
  
  private
    def set_workorder_number
      self.number = "#{self.client.clientnumber}#{month_and_year_string}-#{self.monthlySequenceNumber}" if client
    end
    
    def set_monthly_sequence_number
      self.monthlySequenceNumber = get_next_sequence_number
    end
    
    def created_this_month
      WorkOrder.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).count
    end
    
    def get_next_sequence_number
      "%03d" % (created_this_month + 1)
    end
    
    def month_and_year_string
      "#{Date.today.year.to_s[-2,2]}#{"%02d" % Date.today.month.to_s}"
    end
    
end
