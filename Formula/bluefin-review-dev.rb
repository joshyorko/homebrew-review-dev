class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260924170418"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924170418-2c4fa326a36c/bluefin-review-dev-aarch64.tar.gz"
    sha256 "a31d7d822a3d801d95821f6c0dacd92c248b007f4a8c0e67200e0a2f85af9cd9"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924170418-2c4fa326a36c/bluefin-review-dev-x86_64.tar.gz"
    sha256 "0641a8b1da326d6c0e8be52051d6afec2e3a6c4beb1d5379c9f1eac9e21a089b"
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
