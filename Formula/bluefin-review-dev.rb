class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260924162325"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924162325-b55a3c12a5ed/bluefin-review-dev-aarch64.tar.gz"
    sha256 "7eef02e90a83d3b4ba04c93cb932613d31592afae3291f7982dbb96e6dc33198"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924162325-b55a3c12a5ed/bluefin-review-dev-x86_64.tar.gz"
    sha256 "75f6f3c50c4e9e16e314576cac519a02fdc24d4f2a056cb8610801d9cde6664b"
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
