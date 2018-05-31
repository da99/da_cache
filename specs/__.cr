
require "da_spec"
require "file_utils"
require "../src/da_cache"



extend DA_SPEC

def reset
  Dir.glob("/tmp/da_cache/da_cache.spec_value.*").each { |x|
    FileUtils.rm_rf(x)
  }
end

describe "DA_Cache.read" do

  it "retrieves value from cache" do
    reset
    key = "da_cache.spec_value.read"
    DA_Cache.write(key, "2")
    assert DA_Cache.read(key) == "2"
  end # === it ""retrieves value from cache""

end # describe

describe ".read_or_write" do

  it "writes value if not existed" do
    reset
    val = Time.now.to_s
    key = "da_cache.spec_value.read_or_write"
    DA_Cache.read_or_write(key, val)
    assert DA_Cache.read(key) == val
  end # === it "writes value if not existed"

end # === desc ".read_or_write"
