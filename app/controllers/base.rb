Kaja.controllers :base, cache: true do

  get :index, %r{/(en)?} do
    @page_id = 'Index'
    render :index
  end

  get :entry, %r{/(en/)?entry} do
    @page_id = 'Entry'
    render :entry
  end

  get :faq, %r{/(en/)?faq} do
    @page_id = 'Faq'
    render :faq
  end

  get :about, %r{/(en/)?about} do
    @page_id = 'About'
    render :about
  end

  get :kaja, %r{/(en/)?kaja} do
    @page_id = 'Kaja'
    @nominees = Nominee.of(2012)
    render :kaja
  end

end
