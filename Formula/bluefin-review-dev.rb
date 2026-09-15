class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260915050327"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915050327-88071e08197a/bluefin-review-dev-aarch64.tar.gz"
    sha256 "843517c02a80ecc323ea5ea4878ace4cb2e9ab5cde3d630185a5409377324dff"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915050327-88071e08197a/bluefin-review-dev-x86_64.tar.gz"
    sha256 "97eee014372be5f59dcb2f2500532fe558e7697a2426eabac0aeb55bd8c036b0"
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
