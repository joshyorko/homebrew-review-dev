class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261020154140"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261020154140-06bd3e6f41fd/bluefin-review-dev-aarch64.tar.gz"
    sha256 "ee3b3ff94b3ebc043f92c87bb54452b15083d0b17e6a807f596df9c92a8ae7c3"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261020154140-06bd3e6f41fd/bluefin-review-dev-x86_64.tar.gz"
    sha256 "e0b9ad0b67c039a263a1b0a698c886fa1ed37e2dbd99e784c0be8e8cb90cb43c"
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
