class Post < ApplicationRecord
    validates :title, presence: true, length: { maximum: 20}
    validates :start_date,presence: true
    validates :end_date, presence: true
    validates :memo, length: { maximum: 500 }
    validate :start_end_check

    def start_end_check
        erros.add(:end_date, "は開始日より後の日付を指定してください") unless 
           self.start_date < self.end_date 
    end
end
