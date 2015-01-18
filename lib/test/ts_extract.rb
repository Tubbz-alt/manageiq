require_relative './test_helper'

require 'miq-logger'

# Setup console logging
$log = MIQLogger.get_log(nil, nil)
$log.level = Log4r::WARN

require 'extract/tc_versioninfo.rb'
require 'extract/tc_md5deep.rb'
require 'extract/tc_registry.rb'
