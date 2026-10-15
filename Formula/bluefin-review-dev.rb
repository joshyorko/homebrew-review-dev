class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261015181052"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261015181052-72bf612b62e4/bluefin-review-dev-aarch64.tar.gz"
    sha256 "2819cc797387e19ab970958b83aeae24c97ed9de5a98a7b67d0534460122eef1"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261015181052-72bf612b62e4/bluefin-review-dev-x86_64.tar.gz"
    sha256 "f32f465b055b8c6f43b56578fc0312ebea477fe58ceebde78dffc9ff062abe19"
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
