class MailingSpecs < ActiveRecord::Base
    validates_uniqueness_of :sampleSize, scope: [:height, :width, :weightOfSample]
    validates_presence_of(:sampleSize)
    validates_presence_of(:width)
    validates_presence_of(:height)
    validates_presence_of(:weightOfSample)
end
