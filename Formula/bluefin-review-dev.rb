class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260925203514"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925203514-867a0ab9936a/bluefin-review-dev-aarch64.tar.gz"
    sha256 "7cf55ee4ec1da5dc16896a08b471ee08210a11e94ffb306e36f99d7b3cf963d6"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925203514-867a0ab9936a/bluefin-review-dev-x86_64.tar.gz"
    sha256 "6ea8a375f8e55e7036a6be6d352e40e29a9eceecf274667bb1da71fabd21faa2"
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
