require 'rubygems'
require 'log4r'
require "NmaClient"
require "../util/MiqDumpObj"

class ConsoleFormatter < Log4r::Formatter
	def format(event)
		"**** " + (event.data.kind_of?(String) ? event.data : event.data.inspect) + "\n"
	end
end
$vim_log = Log4r::Logger.new 'toplog'
Log4r::StderrOutputter.new('err_console', :level=>Log4r::DEBUG, :formatter=>ConsoleFormatter)
$vim_log.add 'err_console'

class Dump
	include MiqDumpObj
end

begin
	
	dump = Dump.new
	
	NmaClient.logger	= $vim_log
	NmaClient.wire_dump	= false
	
	nma = NmaClient.new {
		server		SERVER
		auth_style	NmaClient::NA_STYLE_LOGIN_PASSWORD
		username	USERNAME
		password	PASSWORD
	}
	
	rv = nma.aggr_list_info
	# dump.dumpObj(rv)
	
	aia = rv.aggregates.aggr_info.to_ary
	aia.each do |ai|
		puts "Aggregate: #{ai.name}\tavailable space: #{ai.size_available}"
	end
	
rescue => err
	puts err.to_s
	puts err.backtrace.join("\n")
end
