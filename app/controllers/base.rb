Kaja.controllers :base, cache: true do

  get :index, %r{/(\w{2})?} do
    render :index
  end

  get :entry, %r{/(\w{2}/)?entry} do |lcid|
    render :entry
  end

  get :faq, %r{/(\w{2}/)?faq} do |lcid|
    render :faq
  end

  get %r{/(\w{2}/)?(\d{4})} do |lcid, year|
    redirect "#{year}/#{lcid}about"
  end
  get %r{/(\w{2}/)?about} do |lcid|
    redirect "/#{current_year}/#{lcid}about"
  end
  get :about, %r{/(\d{4}/)?(\w{2}/)?about} do
    render "#{current_year}/about"
  end

  get %r{/(\w{2}/)?kaja} do |lcid|
    redirect "2012/#{lcid}kaja"
  end
  get :kaja, %r{/2012/(\w{2}/)?kaja} do
    @nominees = Nominee.of(2012)
    render "2012/kaja"
  end

end
