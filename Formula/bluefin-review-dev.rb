class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260928101011"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928101011-1dece496cefb/bluefin-review-dev-aarch64.tar.gz"
    sha256 "a7f111a53230d377a6262dea57e7dd31ba9a858b678632b6bc493cfe9e45b295"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928101011-1dece496cefb/bluefin-review-dev-x86_64.tar.gz"
    sha256 "04d7152b8b2b8d94015c496d5ae1c3a1aafd2f7369793ab69e114607e5507e59"
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
