class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260917115018"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260917115018-44acc1339f39/bluefin-review-dev-aarch64.tar.gz"
    sha256 "3b0e7296964acfd9243a829e331c76837636022d5fc03581b946cbf364580d99"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260917115018-44acc1339f39/bluefin-review-dev-x86_64.tar.gz"
    sha256 "90bd427283d00d6bad0a8214a138f14dabe962b5e6d7f2d621db3e9faf38f467"
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
