class HardWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(company_token,priority,os,device,memory,storage)

    feedback=Feedback.new
    feedback.company_token=company_token
    feedback.priority=priority
    state=State.new
    state.os=os
    state.device=device
    state.memory=memory
    state.storage=storage
    puts "#{state.storage}"
    feedback.save
    state.save
    puts "#{state.storage}"
  end
end
