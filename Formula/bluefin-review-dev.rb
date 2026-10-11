class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261011204919"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261011204919-0f1d7fc8a5ee/bluefin-review-dev-aarch64.tar.gz"
    sha256 "329c4cfa4be4f3bab176e616c36aaebfdb1f85f770acec819a526f96ec167412"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261011204919-0f1d7fc8a5ee/bluefin-review-dev-x86_64.tar.gz"
    sha256 "ebea80b06e23eb80b41d1ba9f1eb0e874a15e6135aff0d20c3c75ea9ad42c5f1"
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
