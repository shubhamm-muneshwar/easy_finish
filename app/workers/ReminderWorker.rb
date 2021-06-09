class ReminderWorker
  include Sidekiq::Worker

  def perform(opts = {})
    method  = opts["method"]
    user    = User.find_by(id: opts["user_id"])
    task    = Task.find_by(id: opts["task_id"])
    
    unless task
      Rails.logger.error("ReminderWorker order not found for id #{opts[:task_id]}")
      return
    end

    if (opts["reminder_datetime"].to_i == task.end_date.to_i) and task.task_status.status != 'Done'
      ReminderMailer.reminder_send(user, task, method).deliver_now
    end
  rescue => e
    Rails.logger.error("Error in ReminderWorker: #{e.message}")
    raise e
  end
end
