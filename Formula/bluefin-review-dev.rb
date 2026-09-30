class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260930182018"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260930182018-3967adcaef57/bluefin-review-dev-aarch64.tar.gz"
    sha256 "0b022d7d27ffe31b1e33ce2806bd71e9f03e965b17e4b1af98f7e8a417de0a76"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260930182018-3967adcaef57/bluefin-review-dev-x86_64.tar.gz"
    sha256 "404944501024f25b3c31ef51ba56d0919fb269cc3d2a96c7cb864e9ff48e2159"
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
