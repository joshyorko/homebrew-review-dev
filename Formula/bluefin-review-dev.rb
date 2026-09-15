class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260915133352"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915133352-6dce0c766290/bluefin-review-dev-aarch64.tar.gz"
    sha256 "b7abc95a7eae2dcedf14e7162b22b1f9a5d9ebe320577d0a2ff3c0baacb0223a"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915133352-6dce0c766290/bluefin-review-dev-x86_64.tar.gz"
    sha256 "9385349e975b77df4a2ca77e06f4a0ce5465a618ce2e17d0e1a275ce383bffd6"
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
