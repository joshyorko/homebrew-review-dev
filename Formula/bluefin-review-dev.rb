class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260914131444"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260914131444-cba85517a7bc/bluefin-review-dev-aarch64.tar.gz"
    sha256 "d5edbabb66f7bf47901cab74370555f87b1240fbd0c6538893c3c0f875b993d6"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260914131444-cba85517a7bc/bluefin-review-dev-x86_64.tar.gz"
    sha256 "cc101a6944e13a42b27d34bbffa01ba17ee69b3018063b3c67796796f35009d0"
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
