class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260929203614"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260929203614-eab22652bc68/bluefin-review-dev-aarch64.tar.gz"
    sha256 "375ef5a80e708abaae24b70154ea82736878a8276e0b3900c38c7de700513a56"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260929203614-eab22652bc68/bluefin-review-dev-x86_64.tar.gz"
    sha256 "93389f41884e98a757575d6718216028fe9b667f7f08e211a6b06867e069ee4b"
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
