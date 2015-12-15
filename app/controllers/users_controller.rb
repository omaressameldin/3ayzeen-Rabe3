class UsersController < ApplicationController

  def index
    @user = User.find :all
  end

  def hany
    @user = User.new(user_params)
    @u = User.where(:email => @user.email)
    if(@u == nil  || @u == [])
      if @user.save
        redirect_to :action => 'show', :id => @user.id
      else
        render :action => 'new'
      end
    else
      redirect_to :action => 'show', :id => @u.id
    end
  end

  def show
    @user = User.find params[:id]
    # @user2 = User.new
    # @user2.user_id = params[:id]        # use this to send receiver_id to post#create
    @post = Post.new
    @myPost = Post.new

    @myPost = Post.where({user_id: params[:id]})
    @myPostc = @myPost.all.includes(:comments)
    @comment = Comment.new

    render json: @user

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to :action => 'show', :id => @user.id
    else
      render :action => 'new'
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
  end

  def edit
    @user = User.find(params[:id])
    if current_user == @user
      render 'new'
    else
      redirect_to({ action: "index"})
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to({ action: "index"})
    else
      render 'new'
    end
  end



  private

  def user_params
    params.permit(:email, :first_name, :last_name, :password, :image, :x_loc, :y_loc, :gender, :available, :phone_number)
  end

end
