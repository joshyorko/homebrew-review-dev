class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260916154016"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916154016-365abb199a4f/bluefin-review-dev-aarch64.tar.gz"
    sha256 "ac853bd284eec348eb59e37713b40adf522480e9824f792758865f73c1f9b22c"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916154016-365abb199a4f/bluefin-review-dev-x86_64.tar.gz"
    sha256 "a874ba23d38d958d8883f9acc62e02aae71d84919d8db9cb4729c10f72eaf271"
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
