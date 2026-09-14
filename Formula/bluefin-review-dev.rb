class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260914195005"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260914195005-cba85517a7bc/bluefin-review-dev-aarch64.tar.gz"
    sha256 "cc7ba3bde9e7bb2d34a6c7b6204ef9759f99961b12dd51c3fa810794d02d0a56"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260914195005-cba85517a7bc/bluefin-review-dev-x86_64.tar.gz"
    sha256 "d4cb02f100374d4163e11400d1829f9e07cdd170aea5ac327a32b3e3c9389288"
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
