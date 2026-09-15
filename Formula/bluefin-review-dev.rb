class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260915212059"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915212059-5d5a4fd676af/bluefin-review-dev-aarch64.tar.gz"
    sha256 "beb04e2db3fd84471e3f1b3290f3ad7044fc0a5e988f7863bc3754d6bc0c774d"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260915212059-5d5a4fd676af/bluefin-review-dev-x86_64.tar.gz"
    sha256 "f11063ab39b6aded7b9f529efa7bb3f7e661dd308c9555ea4effdddaeafe40a2"
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
