class Post < ApplicationRecord
    validates :title, presence: true, length: { maximum: 20}
    validates :start_date,presence: true
    validates :end_date, presence: true
    validates :memo, length: { maximum: 500 }
    validate :start_end_check

private
    def start_end_check
        if start_date != nil && end_date!= nil
            errors.add(:end_date, "は開始日以降の日付で選択してください。") unless self.start_date < self.end_date    
        end
    end
end
