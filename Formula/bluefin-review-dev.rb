class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260930191503"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260930191503-c24662bc4ef0/bluefin-review-dev-aarch64.tar.gz"
    sha256 "e071e20a1b60b99a47560160194b8fe0436d0a2456f426eb7e3af8d9dd05a360"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260930191503-c24662bc4ef0/bluefin-review-dev-x86_64.tar.gz"
    sha256 "fa4805ac7dd7f09c473b7b27397b66d6a1643fa7363b8d929139ea17c8c92476"
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
