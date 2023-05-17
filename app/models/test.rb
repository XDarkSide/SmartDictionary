class Test < ApplicationRecord
    belongs_to: statistic

    attribute :startTime, :time
    attribute :endTime, :time
end
