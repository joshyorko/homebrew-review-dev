class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260925203148"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925203148-88c600ad9d1a/bluefin-review-dev-aarch64.tar.gz"
    sha256 "4628a29780704d51703eace923f8d720bc228fe4c39dedf5c30fb2e636b08cc5"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260925203148-88c600ad9d1a/bluefin-review-dev-x86_64.tar.gz"
    sha256 "ff18734c2279f6df3ce324a66eeb6c013b76a01466ff6555c80b6abb9f1db918"
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
