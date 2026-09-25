class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260925210058"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925210058-c71fcc957fde/bluefin-review-dev-aarch64.tar.gz"
    sha256 "edd65cc94878958f0bdc095bfb2410093b2ad18f2fd55df47426bddd451e1d9a"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925210058-c71fcc957fde/bluefin-review-dev-x86_64.tar.gz"
    sha256 "0e2306670aecb5e9861329f9a4e288235425f6684594b9a06e07365dcd347f37"
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
