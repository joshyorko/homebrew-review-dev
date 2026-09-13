class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913224714"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913224714-db284da7088c/bluefin-review-dev-aarch64.tar.gz"
    sha256 "6570a240b24b75877bc6c02b317e4440276fab47d93bf915ba2010b67fa3ff39"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913224714-db284da7088c/bluefin-review-dev-x86_64.tar.gz"
    sha256 "655ded03ee51a3f7ba573e202233d179df65a4371385652f4339348305b883f1"
  end
  def install
    libexec.install "launcher", "build.json", "build.txt"
    bin.install "bluefin"
    bin.install_symlink libexec/"launcher/bin/bluefin-contribute"
  end
  test do
    assert_match "Usage: bluefin", shell_output("#{bin}/bluefin 2>&1", 2)
    assert_predicate libexec/"launcher/bluefin-review.sif", :executable?
  end
end
