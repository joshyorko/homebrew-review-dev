class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261023155324"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261023155324-67abdea7c826/bluefin-review-dev-aarch64.tar.gz"
    sha256 "094cb62def37ef74f86a4d1bb24129961a87e69251a329c9131ed50af6b16d2c"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261023155324-67abdea7c826/bluefin-review-dev-x86_64.tar.gz"
    sha256 "bbe049f6b329ca91da3552c206c94abdd8f138ca65ed45895d8533458bc3e918"
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
