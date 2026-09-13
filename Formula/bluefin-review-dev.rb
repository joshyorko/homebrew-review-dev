class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913202539"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913202539-73d1d81ca13b/bluefin-review-dev-aarch64.tar.gz"
    sha256 "d674f41cb23d35a25f4a693636f9a1a62590da442f72c4f1994f9d131aaf9970"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913202539-73d1d81ca13b/bluefin-review-dev-x86_64.tar.gz"
    sha256 "2a96376f559e69c63ec012f5e189e90ddb5d0d817e001cbf50d44b5fce85e2d1"
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
