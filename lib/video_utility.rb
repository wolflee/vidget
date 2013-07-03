module VideoUtility
  def extract(raw_info)
    return nil if raw_info.blank?
    re = Regexp.new(/Video Site:\s(?<site>\w+\.\w+).*\nTitle:\s(?<title>.*)\nType:\s.*(?<type>(webm|flv|mp4)).*\nSize:\s.*\((?<size>\d+\s)Bytes\)/)
    m = re.match raw_info
    if m[:title]
      {site: m[:site], title: m[:title].strip, type: m[:type], size: m[:size].to_i}
    else
      {}
    end
  end

  def info(url)
    cmd = "you-get -i #{url}"
    system cmd
    if $?.exitstatus == 0
      %x[#{cmd}]
    else
      nil
    end
  end

  def download_video(url, dir_path = nil)
    if dir_path
      cmd = "you-get -o #{dir_path} #{url}"
    else
      cmd = "you-get #{url}"
    end
    system cmd
    $?.exitstatus == 0 ? true : false
  end
end
