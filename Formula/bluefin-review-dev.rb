class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260916181804"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916181804-f28eb9ae3c7e/bluefin-review-dev-aarch64.tar.gz"
    sha256 "fd25bbec552840583ee4bbe0933233daa812d24d635cd38c3042d5ed387cb3e2"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916181804-f28eb9ae3c7e/bluefin-review-dev-x86_64.tar.gz"
    sha256 "ca4fddd242b670aa6320c457be03c427c2d9b13aa27d76b0530a7acf3e4a179f"
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
