class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261012141504"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261012141504-a1ff8a1b0fce/bluefin-review-dev-aarch64.tar.gz"
    sha256 "2876c332118ef1be9020cc7df4842acc163b6e14cc503676c5ced5c406938e2c"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261012141504-a1ff8a1b0fce/bluefin-review-dev-x86_64.tar.gz"
    sha256 "b7d31f828ac9e25ed85167bc6ae6e7e52cc59978a5b6c81bf3de8e2d7de12ec7"
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
