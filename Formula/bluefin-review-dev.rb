class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260925100817"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925100817-7c62d89e30f4/bluefin-review-dev-aarch64.tar.gz"
    sha256 "c716711d5270fa6e440842dd03f25c055db5779962166166211459bad1947988"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925100817-7c62d89e30f4/bluefin-review-dev-x86_64.tar.gz"
    sha256 "8ee10bde9c6b0656de7e8a678ec9ebc6657c25c3fa3acb55dc99387bbf7a1cb1"
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
