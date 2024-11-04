# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Thinkport < Formula
  desc "This cli tool provides a set of commands related to Thinkport. This is a technical experiement and not intended for production use."
  homepage "https://github.com/vergissberlin/thinkport"
  version "0.0.83"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.83/thinkport_darwin_arm64.tar.gz"
      sha256 "a323508171f43af5e2b1b073998092df67f61f1ff4011b94b53adbed243c42d2"

      def install
        bin.install "thinkport"
      end
    end
  end

  on_linux do
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/vergissberlin/thinkport/releases/download/0.0.83/thinkport_linux_arm64.tar.gz"
        sha256 "1ae67e373c4360315ac6a3316c6c582b83883b5c4c1105858869b473cc2a6b9e"

        def install
          bin.install "thinkport"
        end
      end
    end
  end

  def caveats
    <<~EOS
      It uses a http client to collect the data. Internet connection is required.
    EOS
  end

  test do
    system "#{bin}/thinkport", "--version"
  end
end
