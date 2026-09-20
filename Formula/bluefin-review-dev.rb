class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260920160700"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260920160700-daccb826d06e/bluefin-review-dev-aarch64.tar.gz"
    sha256 "7d919a7c9b172a56d387b30c815cd193e0188df80a7efc22aadc662616b40bdd"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260920160700-daccb826d06e/bluefin-review-dev-x86_64.tar.gz"
    sha256 "83879631964580751fab5ca857154868d385ecad7782672b1d56c6242cfed433"
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
