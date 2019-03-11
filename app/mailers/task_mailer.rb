class TaskMailer < ApplicationMailer
	default from: 'task@example.com'

	def creation_email(task)
		@task = task
		mail(
			subject: 'タスク完成完了メール',
			to: 'user@example.com'
			# from: 'taskleaf@example.com'
		)
	end
end

