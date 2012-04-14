require 'spec_helper'

describe "Community Model" do
  let(:community) { Community.new }
  it 'can be created' do
    community.should_not be_nil
  end
end
