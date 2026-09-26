class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260926150621"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260926150621-3445683cf77b/bluefin-review-dev-aarch64.tar.gz"
    sha256 "bb92bfeb3eff4de457fc61b53d14c908918b0c893d437a756b1f0d7610786137"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260926150621-3445683cf77b/bluefin-review-dev-x86_64.tar.gz"
    sha256 "d49c78abc202979caa581c0dc1f8a27ea7c8e97d2e12aef19252505ef9306fc5"
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
