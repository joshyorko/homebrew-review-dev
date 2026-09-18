class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260918172536"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260918172536-ba416e6491a6/bluefin-review-dev-aarch64.tar.gz"
    sha256 "6e5b59c9a2cd6b2522ac97b2d705672608281420d579420817ae1bd58cc6a384"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260918172536-ba416e6491a6/bluefin-review-dev-x86_64.tar.gz"
    sha256 "2dae2d5cb4e375568930811cf4525edfc7a5090fba9bf20d4dd9c058ced85454"
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
