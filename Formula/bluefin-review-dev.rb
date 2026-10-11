class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261011141648"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261011141648-e67d001b7d99/bluefin-review-dev-aarch64.tar.gz"
    sha256 "b0c3a82df0937f67f809565b9cc02abd682fa698bfec7cc40d148506bccc2aa5"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261011141648-e67d001b7d99/bluefin-review-dev-x86_64.tar.gz"
    sha256 "075fa7096459d9a83ab8654ecbd3c2a685d18c27e5e3f7eba305c9b8b36bbe4b"
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
