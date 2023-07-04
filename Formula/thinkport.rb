# Documentation: 
# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula

class Thinkport < Formula
  desc "This cli tool provides a set of commands related to Thinkport. This is a technical experiement and not intended for production use."
  homepage "https://github.com/vergissberlin/thinkport"
  license "MIT"
  version "0.0.31"
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
        url "https://github.com/vergissberlin/thinkport/releases/download/0.0.31/thinkport_Darwin_arm64.tar.gz"
        sha256 "b585d78a903fc2f8a921cf8681683dea684b4ebb62cba29a4ae8f744119b02fc"
      def install
        bin.install "thinkport"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.31/thinkport_Linux_x86_64.tar.gz"
      sha256 "54f4b402dc3d5dcc51504fd627d69ba79b1e62b40933cc6f0d0481c39c6d2a7a"
      def install
        bin.install "thinkport"
      end
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
        url "https://github.com/vergissberlin/thinkport/releases/download/0.0.31/thinkport_Linux_i386.tar.gz"
        sha256 "2179ceed52e94bb09907623c5df69b5b5b87e529e44c2f2586d4a5e64dfb5825"
        def install
            bin.install "thinkport"
        end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.31/thinkport_Linux_arm64.tar.gz"
      sha256 "00c2cb32489d32f711ffe8a407fe4f234546d09a61f48ecefac388ce052145f6"
      def install
        bin.install "thinkport"
      end
    end
  end


 test do
    system "#{bin}/thinkport -v"
  end
end
