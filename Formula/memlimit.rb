class Memlimit < Formula
  desc "Zero-dependency memory limiter using phys_footprint (macOS) and PSS (Linux)"
  homepage "https://github.com/rmk40/memlimit"
  url "https://github.com/rmk40/memlimit/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "f2136e3a2288335909c35460a1b6b5934d4582945d1a91eeeb6bf1d070f52cda"
  license "MIT"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "memlimit #{version}", shell_output("#{bin}/memlimit --version")
    system bin/"memlimit", "1G", "--", "true"
  end
end
