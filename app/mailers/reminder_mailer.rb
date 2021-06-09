class ReminderMailer < ApplicationMailer

  def self.reminder_send(user, task, method)
    @user = user
    @task = task

    subject, message = get_email_metadata(method)

    send_email(user.email, subject, message)
  end


  private

  def self.get_email_metadata(method)
    @time_left = (method=='one_hour_reminder') ? '24 Hours' : '1 Hour'
    return reminder_subject, reminder_message
  end

  def self.reminder_message
    "
    Hi #{@user.email},

    Your task - #{@task.title} is due at #{@task.end_date.strftime("%d/%m/%Y %I:%M %p")}.
    Your just have #{@time_left} to finish it.

    Thanks,
    Easy Finish
    "
  end

  def self.reminder_subject
    "Reminder || Task Approaching || #{@time_left} To Go"
  end

end
