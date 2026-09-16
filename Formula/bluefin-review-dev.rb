class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260916171757"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916171757-361c5d437984/bluefin-review-dev-aarch64.tar.gz"
    sha256 "a59acaf6872b4b532d440137477c23b5a28d43e2822803dc8cf7ca805ddf8fc7"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916171757-361c5d437984/bluefin-review-dev-x86_64.tar.gz"
    sha256 "02a41a526aa3a5a47b8b817650d0079fdd4a64949b89b939415af79a751f51d4"
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
