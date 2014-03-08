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

    it { get '/2012';    expect(last_response).to be_redirect }
    it { get '/en/2012'; expect(last_response).to be_redirect }

    it { get '/2012/about';    expect(last_response).to be_ok }
    it { get '/en/2012/about'; expect(last_response).to be_ok }
  end

  describe :kaja do
    it { get '/kaja';    expect(last_response).to be_redirect }
    it { get '/en/kaja'; expect(last_response).to be_redirect }

    it { get '/2012/kaja';    expect(last_response).to be_ok }
    it { get '/en/2012/kaja'; expect(last_response).to be_ok }
  end

end
