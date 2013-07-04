class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def create
    @video = Video.create(url: params[:url])
    if @video.save
      VideoWorker.perform_async(@video.id)
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
