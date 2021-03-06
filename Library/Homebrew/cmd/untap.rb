require "tap"

module Homebrew
  def untap
    raise "Usage is `brew untap <tap-name>`" if ARGV.empty?

    ARGV.named.each do |tapname|
      tap = Tap.fetch(tapname)
      raise "untapping #{tap} is not allowed" if tap.core_tap?
      tap.uninstall
    end
  end
end
