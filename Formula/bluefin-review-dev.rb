class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260915021725"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915021725-150f8e1eba39/bluefin-review-dev-aarch64.tar.gz"
    sha256 "d0e015e2a00d6d0b75b705104e85b73a5d2ee9af6c7f18eace3e0e31aac090c2"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915021725-150f8e1eba39/bluefin-review-dev-x86_64.tar.gz"
    sha256 "ea0ef3db68a750021bdf33f14b8f016c26315aa6364e2be84ccc3deb5b44284e"
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
