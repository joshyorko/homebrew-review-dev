class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260920141734"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260920141734-f3a86856fd9e/bluefin-review-dev-aarch64.tar.gz"
    sha256 "d44db8b15a0e86a019e2e53d31f56d4d602fa2f58b828e126aa6533c82f947f6"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260920141734-f3a86856fd9e/bluefin-review-dev-x86_64.tar.gz"
    sha256 "a63c52fe89027feaedcd57c4fb0918174f60b9f633cb39eb300a79f284effa14"
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
