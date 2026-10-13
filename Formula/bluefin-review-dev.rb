class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261013152226"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261013152226-121c38d16f4c/bluefin-review-dev-aarch64.tar.gz"
    sha256 "0d0228f5b720cdde947721cf45ec7e1546fe11a6f4e2f9cc3f40cfeada62894e"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261013152226-121c38d16f4c/bluefin-review-dev-x86_64.tar.gz"
    sha256 "58928c45d59b9513db79bb47a3854552f7a35f3379a629d91f1ca2f9cb328bc0"
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
