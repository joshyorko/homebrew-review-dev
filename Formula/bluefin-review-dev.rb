class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261013170546"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261013170546-5fb2bcb26944/bluefin-review-dev-aarch64.tar.gz"
    sha256 "e9e5fefd968587b990d8fe5a54c4cac2877a154da48ed7707819b6757b3a8d97"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261013170546-5fb2bcb26944/bluefin-review-dev-x86_64.tar.gz"
    sha256 "aded56efa7f1fdcd917c5bf74049290f6715f129ebfca82f9308d19f42a67c2e"
  end
  def install
    libexec.install "launcher", "build.json", "build.txt"
    bin.install "bluefin"
  end
  test do
    assert_match "Usage: bluefin", shell_output("#{bin}/bluefin 2>&1", 2)
    assert_predicate libexec/"launcher/bluefin-review.sif", :executable?
  end
end
