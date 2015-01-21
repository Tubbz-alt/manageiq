require 'db/MiqBdb/MiqBdb'
require 'db/MiqBdb/MiqBdbHash'
require 'db/MiqBdb/MiqBdbPage'

module MiqBerkeleyDB
  
  class MiqBdbUtil
	
    def initialize(fs = nil)
      @fs = fs
    end

  	def getkeys(fname)
  		bdb  = MiqBdb.new(fname, @fs)
  		keys = bdb.keys
  		bdb.close
  		return keys
		end
		
	end
end
