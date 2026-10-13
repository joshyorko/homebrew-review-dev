class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261013164127"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261013164127-7d94bddafeac/bluefin-review-dev-aarch64.tar.gz"
    sha256 "50b986109e78a9a9d4f21ec62410db6530fea157020ba1c2bd45a39bc345a01a"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261013164127-7d94bddafeac/bluefin-review-dev-x86_64.tar.gz"
    sha256 "8cb27ee31067a293e499d447b882898a9d83feda70ba22dda7ab85517dd09260"
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
