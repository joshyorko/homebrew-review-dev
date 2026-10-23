class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261023140832"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261023140832-fdd26cd8d5f9/bluefin-review-dev-aarch64.tar.gz"
    sha256 "787093613324a0e66458a643f6454f98179713f42f29e49bd8e1e1adaf37a1c6"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261023140832-fdd26cd8d5f9/bluefin-review-dev-x86_64.tar.gz"
    sha256 "f8d5c444299530a8c209992e4b6d567d364ed93bffa5dd34ffce5e776161c7a9"
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
