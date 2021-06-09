# Easy Finish

Easy finish is a simple task management tool that allows you to create tasks and send reminders to you for these tasks.

### Tech Stack

Ruby - 2.5.1
Rails 6.1.3.2
PostgreSQL

##### Configuration
  ```
  SMTP_DEFAULT_FROM=example@gmail.com
  SMTP_USER_EMAIL=example@gmail.com
  SMTP_EMAIL_PASSWORD=xxxxxxxxxx
```

Configure your database details in database.yml file.

##### What's incorporated?

1. Device Authentication
2. Crud operations for Tasks
3. Reminder 1 hour before and 24 hours before the task deadline. (No reminder if the deadline is prior to 1 hour)
4. Ability to add task deadline to Google Calendar. (Not to be mistaken with Google Calendar API Integration)

##### What can be improved?
1. Very basic user interface. Can be turned into responsive UI.
2. Need More Test cases.
3. Google Calendar API Integration
4. Better CSS.
