class Task < ApplicationRecord
  belongs_to :user
  belongs_to :task_status
  after_save :send_reminder_emails
  validate :end_date_cannot_be_in_the_past

  def calendar_url
    calender_first = end_date.strftime('%Y%m%dT%k%M%S')
    calender_last = (end_date - 3600).strftime('%Y%m%dT%k%M%S')
    var = "https://calendar.google.com/calendar/render?action=TEMPLATE&dates=#{calender_first}/#{calender_last}&ctz=Asia/Kolkata&text=#{title}&details=#{notes}"
  end


  private

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < DateTime.now
      errors.add(:end_date, "can't be in the past")
    end
  end

  def send_reminder_emails
    if self.end_date > 24.hours.from_now
      ReminderWorker.perform_at(
        self.end_date - 24.hours,
        task_id: self.id,
        user_id: self.user.id,
        method: "24_hour_reminder",
        reminder_datetime: self.end_date.to_i
      )
    end

    if self.end_date > 1.hours.from_now
      ReminderWorker.perform_at(
        self.end_date - 1.hours,
        task_id: self.id,
        user_id: self.user.id,
        method: "one_hour_reminder",
        reminder_datetime: self.end_date.to_i
      )
    end
  end

end
