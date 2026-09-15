class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260915040545"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915040545-ff2f37a35a73/bluefin-review-dev-aarch64.tar.gz"
    sha256 "a9680799ad84eccd4f92c634f9291b19429376a82644d5de1368c4e67640d9f9"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915040545-ff2f37a35a73/bluefin-review-dev-x86_64.tar.gz"
    sha256 "b6045e9c708860014a12a8ad1f793cbdb5783c9e5052c5f90650bbe43f11ce23"
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
