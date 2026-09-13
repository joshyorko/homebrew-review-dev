class BluefinReviewDev < Formula
  desc "Personal development builds of Bluefin Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20260913210112"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "gh"
  conflicts_with "bluefin-contributor-tools", because: "both provide bluefin"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913210112-0f1c99fd9e9e/bluefin-review-dev-aarch64.tar.gz"
    sha256 "8a99c808c97358ce1c446f393752f4180e275ac519f0076c8c2cd8080d15bf84"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20260913210112-0f1c99fd9e9e/bluefin-review-dev-x86_64.tar.gz"
    sha256 "e1c265a05817409ff975079aafc5b0f56e1e4a485ec5c0354daa090ee8f0f68e"
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
