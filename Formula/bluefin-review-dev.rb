class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261013160137"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261013160137-7d94bddafeac/bluefin-review-dev-aarch64.tar.gz"
    sha256 "ca1b97dbaa9007e71e2956b53c8142c9e6756cdffe26822727a0d32e3c8f2040"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261013160137-7d94bddafeac/bluefin-review-dev-x86_64.tar.gz"
    sha256 "74f8d8050091fde92e102ad4ad22fd9c7b60aa4901cfcf9574feb754bda5d033"
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
