class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261015173530"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261015173530-b6c9b3181a41/bluefin-review-dev-aarch64.tar.gz"
    sha256 "e65b4766338a94710fc34e34d303f4ff663abcf7734f6fc5068d874dafc894bf"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261015173530-b6c9b3181a41/bluefin-review-dev-x86_64.tar.gz"
    sha256 "73db325693c4372658a44da8dbc7bce5576d0b583f552f70b012e09b478cff28"
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
