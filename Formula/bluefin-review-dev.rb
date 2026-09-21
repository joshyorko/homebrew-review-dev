class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260921024520"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260921024520-6e1ade814bb9/bluefin-review-dev-aarch64.tar.gz"
    sha256 "7a01ddbbc6ee540c8d96e356f71783dea614d3cb5986dfcec74b8cfd2c504e76"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260921024520-6e1ade814bb9/bluefin-review-dev-x86_64.tar.gz"
    sha256 "8ddd3059d33b4f2a40a9cde630cd276ffc44f6964de126c59ef716fe3557c13d"
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
