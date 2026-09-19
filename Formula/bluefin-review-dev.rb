class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260919222335"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260919222335-6e5af019a794/bluefin-review-dev-aarch64.tar.gz"
    sha256 "769f9dccf2cecae61a8dcfbcba4b0ee350fa08aa1b948d00a00ab4ff89f10202"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260919222335-6e5af019a794/bluefin-review-dev-x86_64.tar.gz"
    sha256 "2885a38a8a96a84546149529729b12ca6d7d13b763246d95530d81d0880b6b16"
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
