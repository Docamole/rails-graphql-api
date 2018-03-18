require 'rails_helper'
require_relative 'stubs/test_job'

RSpec.describe TestJob, type: :job do
  subject(:job) { described_class.new }

  it 'performs without failing' do
    expect(job.perform_now).to eq('puppies!')
  end
end
