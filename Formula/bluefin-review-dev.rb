class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260925105153"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925105153-4ece850ba016/bluefin-review-dev-aarch64.tar.gz"
    sha256 "64c5b375236cc162e0edb3c8070c8f2a09f7012b3f470fe6d58358b59d10ec08"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925105153-4ece850ba016/bluefin-review-dev-x86_64.tar.gz"
    sha256 "59e9802bf7d1c846357c4a14a77965ca38fd5a6efcd43085dddb4e2eddb84c37"
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
