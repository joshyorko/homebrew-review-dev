class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261020150404"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261020150404-3591b7ff1c1d/bluefin-review-dev-aarch64.tar.gz"
    sha256 "44731b63574d97192d97d8e530568721c938032750572e1c125421e364b7f36f"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261020150404-3591b7ff1c1d/bluefin-review-dev-x86_64.tar.gz"
    sha256 "b3dda091ba6c66fae652b1c66c602bdeb7dd0dc0242427104e182ff769d4de2c"
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
