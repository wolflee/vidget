class Video
  include Mongoid::Document
  include VideoUtility
  field :url, type: String
  field :title, type: String
  field :site, type: String
  field :type, type: String
  field :size, type: Integer
  field :correctness, type: Boolean, default: true

  validates :url, presence: true, uniqueness: true

  embedded_in :user

  def extract_info
    extracted_info = extract info url
    self.correctness = !extracted_info.blank?
    update_attributes(extracted_info)
  end

  def download
    self.correctness = download_video(url, ENV["VIDEO_STORAGE_DIR"])
  end

  def storage_path
    Dir.glob(ENV["VIDEO_STORAGE_DIR"] + "/*").grep(Regexp.new(Regexp.escape(title))).first if title
  end

  def download_path
    storage_path[6..-1] if storage_path
  end

  def progress
    (File.size?(storage_path) / size * 100.0 ) if storage_path
  end

  def completed?
    !correctness || progress > 99.9
  end
end
