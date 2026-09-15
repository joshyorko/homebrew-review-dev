class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260915034611"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915034611-5103208d6f66/bluefin-review-dev-aarch64.tar.gz"
    sha256 "faa4cde787542e9416302ab7f0ed5405efff4f2c48ed04786cf6412eeaa0cf96"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915034611-5103208d6f66/bluefin-review-dev-x86_64.tar.gz"
    sha256 "e36dd813d00ba0d546689b2e3d163c8fcb99befdcfec84c4b4d52e1ebcfc1c61"
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
