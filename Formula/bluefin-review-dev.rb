class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913224420"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913224420-be872bdb466b/bluefin-review-dev-aarch64.tar.gz"
    sha256 "fa7c15709ca553bbe66221ca7bbde490280dc994093667b6263aad6914517abd"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913224420-be872bdb466b/bluefin-review-dev-x86_64.tar.gz"
    sha256 "c45654e8a29fd342c43889fe2c04fd1b4113f9801e1a60823df58ad1ab51015a"
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
