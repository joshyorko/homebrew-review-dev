class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913223021"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913223021-73d1d81ca13b/bluefin-review-dev-aarch64.tar.gz"
    sha256 "4ec3b008d4c42fc44108ee4575c187c8ccd4781ec257c2a7a455fed150fe92f7"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913223021-73d1d81ca13b/bluefin-review-dev-x86_64.tar.gz"
    sha256 "a176bf5e16b56a5c0f751d02eb5c95e9ab52213c0b3e0a8405ecf759a8e577ee"
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
