require 'rails/backtrace_cleaner'
require 'minitest/unit'

module MiniTest

  def self.filter_backtrace_with_rails(backtrace)
    filter_backtrace_without_rails(::Rails.backtrace_cleaner.clean(backtrace))
  end

  class << self
    alias :filter_backtrace_without_rails :filter_backtrace
    alias :filter_backtrace :filter_backtrace_with_rails
  end

end

