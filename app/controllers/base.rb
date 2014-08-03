Kaja::App.controllers :base do

  get :index, %r{/(\w{2})?} do
    render :index
  end

  get :faq, %r{/(\w{2}/)?faq} do |lcid|
    render :faq
  end

  get %r{/(\w{2}/)?(\d{4})} do |lcid, year|
    redirect "#{lcid}#{year}/about"
  end
  get %r{/(\w{2}/)?about} do |lcid|
    redirect "#{lcid}#{current_year}/about"
  end
  get :about, %r{/(\w{2}/)?(\d{4}/)?about} do |lcid, year|
    @communities = Community.by(year.delete('/'))
    render "#{year}about"
  end

  get %r{/(\w{2}/)?kaja} do |lcid|
    redirect "#{lcid}#{current_year}/kaja"
  end
  get :kaja, %r{/(\w{2}/)?(\d{4}/)?kaja} do |lcid, year|
    @year     = year.gsub('/', '')
    @nominees = Nominee.by(@year)
    render :kaja
  end

end
