Admin.controllers :posts do

  get :index do
    @posts = Post.all(:order => 'created_at desc')
    render 'posts/index'
  end

  get :new do
    @post = Post.new
    @category = Category.all
    render 'posts/new'
  end

  post :create do
    @post = Post.new(params[:post])
    @category = Category.all
    @post.account = current_account
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect url(:posts, :edit, :id => @post.id)
    else
      render 'posts/new'
    end
  end

  get :edit, :with => :id do
    @post = Post.find(params[:id])
    @category = Category.all
    render 'posts/edit'
  end

  put :update, :with => :id do
    @post = Post.find(params[:id])
    @category = Category.all
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect url(:posts, :edit, :id => @post.id)
    else
      render 'posts/edit'
    end
  end

  delete :destroy, :with => :id do
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = 'Post was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Post!'
    end
    redirect url(:posts, :index)
  end
end
