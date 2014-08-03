require 'spec_helper'

describe "BaseController" do

  describe :index do
    it { get '/';   expect(last_response).to be_ok }
    it { get '/en'; expect(last_response).to be_ok }
  end

  describe :faq do
    it { get '/faq';    expect(last_response).to be_ok }
    it { get '/en/faq'; expect(last_response).to be_ok }
  end

  describe :about do
    it { get '/about';    expect(last_response).to be_redirect }
    it { get '/en/about'; expect(last_response).to be_redirect }

    %w[2012 2013 2014].each do |year|
      it { get "/#{year}";    expect(last_response).to be_redirect }
      it { get "/en/#{year}"; expect(last_response).to be_redirect }

      it { get "/#{year}/about";    expect(last_response).to be_ok }
      it { get "/en/#{year}/about"; expect(last_response).to be_ok }
    end
  end

  describe :kaja do
    it { get '/kaja';    expect(last_response).to be_redirect }
    it { get '/en/kaja'; expect(last_response).to be_redirect }

    %w[2012 2013 2014].each do |year|
      it { get "/#{year}/kaja";    expect(last_response).to be_ok }
      it { get "/en/#{year}/kaja"; expect(last_response).to be_ok }
    end
  end

end
