class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913223341"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913223341-3d16369fd529/bluefin-review-dev-aarch64.tar.gz"
    sha256 "1a1c2bb232a0885c58567668e59343eecaa5b14cd27a3fa5383c38e2c96a5d76"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913223341-3d16369fd529/bluefin-review-dev-x86_64.tar.gz"
    sha256 "68f0963e61f094c5708e580f230d37c8ead6943eb9b71464d3c4968a5acb3fd5"
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
