class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261006172335"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261006172335-ed8a29c89ffa/bluefin-review-dev-aarch64.tar.gz"
    sha256 "bb8ff1bdfcf260787e2dd55af71726b97f6ac449198ecb08be5bc107f97ee317"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261006172335-ed8a29c89ffa/bluefin-review-dev-x86_64.tar.gz"
    sha256 "eda7075c9dbdc0304cb39d84a0ae7d40ba31348e22942aad38813ec6268f2b85"
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
