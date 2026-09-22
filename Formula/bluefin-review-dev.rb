class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260922140034"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260922140034-7f4fd31c53d8/bluefin-review-dev-aarch64.tar.gz"
    sha256 "2392f0fa85641b40138e171846c6e1ed7d70d2f0a0c83ef00af40006e0fa23f6"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260922140034-7f4fd31c53d8/bluefin-review-dev-x86_64.tar.gz"
    sha256 "0b12f4795f034223fbe7c4ea004181008ebfcdc5c014e88307c8575e24b6a1eb"
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
