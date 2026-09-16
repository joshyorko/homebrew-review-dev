class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260916165129"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916165129-e87a344dd5e1/bluefin-review-dev-aarch64.tar.gz"
    sha256 "fd9b8af3ae3dc8e86ce809894dfe3879b48a89559bf9e4490bddfdb6a34cff73"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916165129-e87a344dd5e1/bluefin-review-dev-x86_64.tar.gz"
    sha256 "3e9101cd4255cc38d0af9685c684c0b118d6e6d80e5e4fd5740f5b8088473295"
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
