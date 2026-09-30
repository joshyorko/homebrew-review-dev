class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260930131746"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260930131746-51daa156816b/bluefin-review-dev-aarch64.tar.gz"
    sha256 "c969be3850232d09d3e07d923aaa433e8c4d5fe18d78c57f33a6791d25ad200c"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260930131746-51daa156816b/bluefin-review-dev-x86_64.tar.gz"
    sha256 "feddd0db9989a71b91cb5baf05e5f166acc26ad0b2cbd33b818a5021fd3bf3bc"
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
