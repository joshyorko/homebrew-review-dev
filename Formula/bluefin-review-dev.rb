class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260922192805"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260922192805-18ab40bee9dd/bluefin-review-dev-aarch64.tar.gz"
    sha256 "e096aa222551a8e2355e3e850dc9dfba0c9d6a83925c76fec16a22be116e56d6"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260922192805-18ab40bee9dd/bluefin-review-dev-x86_64.tar.gz"
    sha256 "d3583f1d776433034ef577fffb544a7020ac847320f6b5c015b95cf804072c04"
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
