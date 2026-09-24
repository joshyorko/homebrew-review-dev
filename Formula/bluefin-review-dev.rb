class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260924191050"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924191050-8c23da0c1dc0/bluefin-review-dev-aarch64.tar.gz"
    sha256 "888b70017b3a305c3b568ea5853f938c9349c5f2eb07ec8c9e2c8f1292ed7561"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924191050-8c23da0c1dc0/bluefin-review-dev-x86_64.tar.gz"
    sha256 "858969a506568a7448a3c4e41a50571ce66de40b00f4d1007cffadc52a338870"
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
