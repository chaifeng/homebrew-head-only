class Bazel < Formula
  homepage "http://bazel.io"
  head "https://github.com/google/bazel.git"

  depends_on :java => "1.8+"
  depends_on "libarchive"
  depends_on "protobuf"

  def install
    ENV.prepend_path "PATH", "#{HOMEBREW_PREFIX}/bin"
    system "./compile.sh"
    bin.install "output/bazel"
  end

  test do
    system "touch", "WORKSPACE"
    system "bazel", "help"
  end
end
