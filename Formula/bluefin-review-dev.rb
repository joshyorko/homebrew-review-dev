class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260923200735"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260923200735-8e7c114d4a2b/bluefin-review-dev-aarch64.tar.gz"
    sha256 "3a9e1a27f6156710dc3494fe285f9b1d51122e0f115a6ca0eeb666db57fa73d9"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260923200735-8e7c114d4a2b/bluefin-review-dev-x86_64.tar.gz"
    sha256 "267bfb11151c7c9bcfb8b371910463b8e7e551f0c97c5e3c2108bacbc7089d96"
  end
  def install
    libexec.install "launcher", "build.json", "build.txt"
    bin.install "bluefin"
    bin.install_symlink libexec/"launcher/bin/bluefin-contribute"
  end
  test do
    assert_match "Usage: bluefin", shell_output("#{bin}/bluefin 2>&1", 2)
    assert_predicate libexec/"launcher/bluefin-review.sif", :executable?
  end
end
