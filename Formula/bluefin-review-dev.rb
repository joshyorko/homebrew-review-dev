class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913212344"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913212344-be872bdb466b/bluefin-review-dev-aarch64.tar.gz"
    sha256 "2622ecfd7860b6b7042968322766141e1ec23bdd931968b35490e677fc8d92bb"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913212344-be872bdb466b/bluefin-review-dev-x86_64.tar.gz"
    sha256 "6ff0237488b6527fe16b4371e89a164ab4a4212be08cb07b586ca16183157af1"
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
