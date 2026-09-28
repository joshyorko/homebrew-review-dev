class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260928195735"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928195735-ac7defddbacf/bluefin-review-dev-aarch64.tar.gz"
    sha256 "7b0e905fa1fd30f1420165e313ec16ffe08d3b9ab65a25d380aa7e08f2ba07ae"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260928195735-ac7defddbacf/bluefin-review-dev-x86_64.tar.gz"
    sha256 "51999013206e8df6b0f861d295969a4c6b9fd093a629539f9189189597ef0927"
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
