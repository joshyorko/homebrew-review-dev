class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260916173845"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916173845-e7582946ccb0/bluefin-review-dev-aarch64.tar.gz"
    sha256 "49eecaae19820dac15719ecaa3ceced2541afa9f434505aad58137211328d54a"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260916173845-e7582946ccb0/bluefin-review-dev-x86_64.tar.gz"
    sha256 "78dc703e43a1b04c487b8e1861293cff5557919804ec97e193423b973a691d8b"
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
