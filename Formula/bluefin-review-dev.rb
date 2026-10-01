class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261001210716"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261001210716-483b5e8cb956/bluefin-review-dev-aarch64.tar.gz"
    sha256 "0591b0468a060da7898ad57380a2174a71f0ffd7e9085c09560e16dcc104ecd5"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261001210716-483b5e8cb956/bluefin-review-dev-x86_64.tar.gz"
    sha256 "4ed9aecf8aa2ea523a458ba949a700492dc3f41a0f7c2da7715cb9bd9b3ee832"
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
