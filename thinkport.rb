# Documentation: 
# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula

class Thinkport < Formula
  desc "This cli tool provides a set of commands related to Thinkport. This is a technical experiement and not intended for production use."
  homepage "https://github.com/vergissberlin/thinkport"
  license "MIT"
  depends_on "go" => :optional


 on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.31/thinkport_Darwin_x86_64.tar.gz"
      sha256 "a379e371ff51b9049fe5beda8da5ec9d879964dbbd9e7c5d105a00dc1601dbdd"

      def install
        bin.install "thinkport"
      end
    end
    if Hardware::CPU.arm?
        url "https://github.com/vergissberlin/thinkport/releases/download/0.0.30/thinkport_Darwin_arm64.tar.gz"
        sha256 "b585d78a903fc2f8a921cf8681683dea684b4ebb62cba29a4ae8f744119b02fc"
      def install
        bin.install "thinkport"
      end
    end
  end



  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test thinkport`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
