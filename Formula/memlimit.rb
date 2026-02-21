class Memlimit < Formula
  desc "Zero-dependency memory limiter using phys_footprint (macOS) and PSS (Linux)"
  homepage "https://github.com/rmk40/memlimit"
  url "https://github.com/rmk40/memlimit/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "3bf12edbce25c6e2ecbc71ea1e87197102417dd52d44d2f757ce64c149444f37"
  license "MIT"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "memlimit #{version}", shell_output("#{bin}/memlimit --version")
    system bin/"memlimit", "1G", "--", "true"
  end
end
