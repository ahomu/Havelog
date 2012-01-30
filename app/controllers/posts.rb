Havelog.controllers :posts do
  register WillPaginate::Sinatra

  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index, :provides => [:html, :rss]  do
    @posts = Post.where(:status => 'open').paginate(:page => params[:page], :per_page => 10).order('created_at DESC')

    render 'posts/index'
  end

  get :show, :with => :id do
    @post = Post.find_by_id(params[:id])

    # ページタイトル
    @title = @post.title
    render 'posts/show'
  end

end
