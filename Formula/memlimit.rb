class Memlimit < Formula
  desc "Zero-dependency memory limiter using phys_footprint (macOS) and PSS (Linux)"
  homepage "https://github.com/rmk40/memlimit"
  url "https://github.com/rmk40/memlimit/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "5e8e0b39091c80c5e04aed46d5ce9c0ba2e76b4c98cd29de4b1206d00f16413a"
  license "MIT"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "memlimit #{version}", shell_output("#{bin}/memlimit --version")
    system bin/"memlimit", "1G", "--", "true"
  end
end
