Kaja.controllers :base, cache: true do

  get :index, %r{/(en)?} do
    render :index
  end

  get :entry, %r{/(en/)?entry} do
    render :entry
  end

  get :faq, %r{/(en/)?faq} do
    render :faq
  end

  get :about, %r{/(en/)?about} do
    render :about
  end

  get :kaja, %r{/(en/)?kaja} do
    @nominees = Nominee.of(2012)
    render :kaja
  end

end
