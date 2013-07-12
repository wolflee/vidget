class VideosController < ApplicationController
  def index
    if returned_visitor?
      @videos = current_user.videos.all
    else
      @videos = Video.all.limit(10)
    end
    #@videos = Video.all
  end

  def create
    user = current_user || User.create!
    sign_in user
    @video = user.videos.create(url: params[:url])
    if @video.save
      VideoWorker.perform_async(user.id, @video.id)
      flash[:notice] = "Video is being proccessed, please wait patiently."
    else
      flash[:notice] = "Someting went wrong. Please try again."
    end

    redirect_to root_path



    #@user = User.where(session_id: session[:session_id]).first||User.create(session_id: session[:session_id])
    #num = (rand*100).to_i
    #@video = @user.videos.create(url: "vid #{num}", size: num)
    #if @user.save
    #  flash[:notice] = "User is saved."
    #else
    #  raise
    #end
  end
end
