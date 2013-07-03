class VideoWorker
  include Sidekiq::Worker

  def perform(video_id)
    video = Video.find(video_id)
    video.extract_info
    video.download
  end
end
