class ApplicationMailer < ActionMailer::Base
  # 私の記述
  # default from: ENV["KEY"]
  # layout 'mailer'

  # 模範解答
  default from: 'from@example.com'
  layout 'mailer'
end