class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    'puppies!'
  end
end
