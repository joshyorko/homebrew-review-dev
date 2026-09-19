class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260919132045"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260919132045-5526ba5e8a78/bluefin-review-dev-aarch64.tar.gz"
    sha256 "03b723e73205ac770a1ba234a45d672565690b367781dadb193c1bcecaac9a18"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260919132045-5526ba5e8a78/bluefin-review-dev-x86_64.tar.gz"
    sha256 "56056bf722ef10da8e7f6b876ff0153bb2b9c350516e0513866a2a745fc4afc2"
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
