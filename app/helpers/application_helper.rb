module ApplicationHelper

	def sender(message)
    User.find(message.sent_messageable_id)
  end
  
end
