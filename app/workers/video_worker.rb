class VideoWorker
  include Sidekiq::Worker

  def perform(user_id, video_id)
    user = User.find(user_id)
    video = user.videos.find(video_id)
    video.extract_info
    video.download
  end
end
