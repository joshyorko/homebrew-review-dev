class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260925114648"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925114648-149ccff6430f/bluefin-review-dev-aarch64.tar.gz"
    sha256 "c4d7eb90dd07b4045e08e342ebd91f7e03840e9030ef918f6dd577f1fbf8afb1"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925114648-149ccff6430f/bluefin-review-dev-x86_64.tar.gz"
    sha256 "0b4393e3e52379d3be6f45e411de8f4b3032534e3affd66a1ea72f2206c35e55"
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
