class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260925093153"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925093153-fb8233616b33/bluefin-review-dev-aarch64.tar.gz"
    sha256 "b708a3f43d5073d9a1ed77cf312b098f82f4d082a86610b1e74a243996bc6b1d"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925093153-fb8233616b33/bluefin-review-dev-x86_64.tar.gz"
    sha256 "dc1c504de456f5171b2bee4f323b9c92566d4563a823d4bc25415344f831334c"
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
