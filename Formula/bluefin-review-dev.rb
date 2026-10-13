class BluefinReviewDev < Formula
  desc "Personal development builds of Review"
  homepage "https://github.com/joshyorko/review"
  version "0.20261013181236"
  license "Apache-2.0"
  depends_on :linux
  depends_on "apptainer"
  depends_on "squashfuse"
  depends_on "gh"
  on_arm do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261013181236-f4329fd2b1d1/bluefin-review-dev-aarch64.tar.gz"
    sha256 "c461d94c43f0d5f6ae3e530acb606df5b01befa5eb43ae42e77396ecda0d5147"
  end
  on_intel do
    url "https://github.com/joshyorko/review/releases/download/dev-0.20261013181236-f4329fd2b1d1/bluefin-review-dev-x86_64.tar.gz"
    sha256 "efdc1d3062db4a51e5f64673f2df6e11d0848aca232b96a95293393e4ed39243"
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
