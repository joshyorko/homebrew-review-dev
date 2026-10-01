class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261001173043"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261001173043-fa9556e9b2a9/bluefin-review-dev-aarch64.tar.gz"
    sha256 "e7ee9db697d5094d316580c1a8a8d7124cee3c195ca54e163cc19982846b8738"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261001173043-fa9556e9b2a9/bluefin-review-dev-x86_64.tar.gz"
    sha256 "4dcd7cd5260f4c653444579cf7be19078f73549bf66adda1314badd3517efe3e"
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
