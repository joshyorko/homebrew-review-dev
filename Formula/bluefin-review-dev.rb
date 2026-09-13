class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913203527"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913203527-b332ac78bcd7/bluefin-review-dev-aarch64.tar.gz"
    sha256 "10725930b587558687f5517effed5b323aeaf2ce378ae32a04d94952c5582ddb"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913203527-b332ac78bcd7/bluefin-review-dev-x86_64.tar.gz"
    sha256 "1ce1e0606d615e8514f6933cf27addfa223c11a13e131af47f684c516077ab5c"
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
