class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913203254"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913203254-b332ac78bcd7/bluefin-review-dev-aarch64.tar.gz"
    sha256 "a22abcbd8d6097bef9460864fd93ae9e2a704ab08b3681620822160214f33ac6"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913203254-b332ac78bcd7/bluefin-review-dev-x86_64.tar.gz"
    sha256 "ea42b6c76c68a8440b5c0b2f26541108773d441200019be41f6276d6a6ed6a5a"
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
