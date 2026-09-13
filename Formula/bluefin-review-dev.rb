class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913184536"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  depends_on arch: :x86_64
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913184536-fb69fbf9bd2b/bluefin-review-dev-x86_64.tar.gz"
    sha256 "1b996a96af1aa8078996d0cc525647099bf8b635f13a2f6cd687c23ec083800c"
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
