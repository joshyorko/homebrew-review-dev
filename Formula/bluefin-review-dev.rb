class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913231631"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913231631-a81026edc673/bluefin-review-dev-aarch64.tar.gz"
    sha256 "492b95976e4bce518a4bd372f9343c161702dbe85c9487ae1eebfeb74e2c6faf"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913231631-a81026edc673/bluefin-review-dev-x86_64.tar.gz"
    sha256 "8908a32922a863e2f1846edc0120d70311c51eb833e259e16cadc7087580a237"
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
