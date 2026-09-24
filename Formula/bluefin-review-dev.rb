class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260924090016"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924090016-b78be6bd7b1a/bluefin-review-dev-aarch64.tar.gz"
    sha256 "6951e993c10fc423604772e971ac3e5f6de31283cfdfcbea60c09d79f0cac91f"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260924090016-b78be6bd7b1a/bluefin-review-dev-x86_64.tar.gz"
    sha256 "711f247e40ba314ef5cdc86a1ef83f38593f2bc31deec84425b44232368ba28b"
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
