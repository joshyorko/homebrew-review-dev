class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260929140016"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260929140016-54ecdec918aa/bluefin-review-dev-aarch64.tar.gz"
    sha256 "09e83a0f961c1c3f5c13a61cd542910039c0a1aa181107fe5f49ad6ea6a2ca7d"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260929140016-54ecdec918aa/bluefin-review-dev-x86_64.tar.gz"
    sha256 "f8cdbbc2fbb950fbf82bd6986d50288308ffc75e65ca6948636b2435170fbeb6"
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
