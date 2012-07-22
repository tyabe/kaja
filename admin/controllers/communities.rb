Admin.controllers :communities do

  get :index do
    @communities = Community.all
    render 'communities/index'
  end

  get :show, with: :id do
    @community = Community.find(params[:id])
    render 'communities/show'
  end

  get :new do
    @community = Community.new
    render 'communities/new'
  end

  post :create do
    @community = Community.new(params[:community])
    if @community.save
      flash[:notice] = 'Community was successfully created.'
      redirect url(:communities, :show, id: @community.id)
    else
      render 'communities/new'
    end
  end

  patch :update, map: '/:id' do
    community = Community.find(params[:id])
    if params[:approval].present? && community.update_attributes(approval: params[:approval])
      flash[:notice] = 'Community was successfully updated.'
    else
      flash[:error] = 'Unable to update!'
    end
    redirect url(:communities, :index)
  end

  delete :destroy, with: :id do
    community = Community.find(params[:id])
    if community.destroy
      flash[:notice] = 'Community was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Community!'
    end
    redirect url(:communities, :index)
  end
end
