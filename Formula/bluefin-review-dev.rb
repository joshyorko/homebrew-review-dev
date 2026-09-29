class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260929125440"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260929125440-ca9496e1a659/bluefin-review-dev-aarch64.tar.gz"
    sha256 "42fc3b556a907ad49482f1bb89946489d693280f3f6bab4def95f8d1fdb878be"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260929125440-ca9496e1a659/bluefin-review-dev-x86_64.tar.gz"
    sha256 "456b4145c2a2f714af7e67129d03d623d3e4d26413e736fd276d263fb0e45c69"
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
