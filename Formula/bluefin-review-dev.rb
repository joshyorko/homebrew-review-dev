class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260926100400"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260926100400-08a6722bb125/bluefin-review-dev-aarch64.tar.gz"
    sha256 "4229d88a8d3f6f285677707a19cbc9f77665775ef7f2f16c2252eda5f9bec2ff"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260926100400-08a6722bb125/bluefin-review-dev-x86_64.tar.gz"
    sha256 "96a75da6806d4926f272ba4ee8ca2a89dcaf538dd4f053707c7776038e71cb56"
  end
  def install
    libexec.install "launcher", "build.json", "build.txt"
    bin.install "bluefin"
  end
  test do
    assert_match "Usage: bluefin", shell_output("#{bin}/bluefin 2>&1", 2)
    assert_predicate libexec/"launcher/bluefin-review.sif", :executable?
  end
end
