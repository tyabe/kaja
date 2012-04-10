require 'spec_helper'

describe "Nomination Model" do
  let(:nomination) { Nomination.new }
  it 'can be created' do
    nomination.should_not be_nil
  end
end
