
require "file_utils"

module DA_Cache
  extend self

  DIR = "/tmp/da_cache"

  def write(k : String, v : String)
    FileUtils.mkdir_p(DIR)
    File.write(file_name(k), v)
  end # === def write

  def read(k)
    return nil unless exists?(k)
    File.read(file_name(k))
  end

  def read_or_write(k, default_value)
    return read(k) if exists?(k)
    write(k, default_value)
    read(k)
  end

  def exists?(k)
    File.file?( file_name(k) )
  end

  def file_name(k)
    File.join(DIR, k)
  end

end # === module DA_Cache
