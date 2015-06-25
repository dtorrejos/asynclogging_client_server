class Clientlogger
	attr_accessor :level
	attr_accessor :filename
	attr_accessor :key
	
	def initialize(lvl,fname,ky)
		@level = lvl
		@filename = fname
		@key = ky
	end

	def checkLevel(msgLevel)
		array = ["DEBUG", "INFO", "WARN", "ERROR", "FATAL"]
		hash = Hash[array.map.with_index.to_a] 
		if hash[msgLevel] >=  hash[@level]
			return 1
		else
			return 0
		end

	end

	def log (msglevel,message,*tags)
		res = checkLevel(msglevel)
		randomNum = rand(500000).to_s
		if res != 0
			require 'redis'
			redis = Redis.new
			redis2 = Redis.new
			redis.rpush("#{@key}#{randomNum}",msglevel)
			redis.rpush("#{@key}#{randomNum}",message)
			redis.rpush("#{@key}#{randomNum}",@filename)
			redis.rpush("#{@key}#{randomNum}","#{tags.join(',')}")
			redis.rpush("#{@key}#{randomNum}",randomNum)
			redis.rpush('logkey',"#{@key}#{randomNum}")
		else
			puts "discarding #{@msglevel} log."
		
		end
		
	end

	def debug(message,*tags)
		log('DEBUG',message,tags.join(','))
	end

	def warn(message,*tags)
		log('WARN',message,tags.join(','))
	end

	def info(message,*tags)
		log('INFO',message,tags.join(','))
	end

	def error(message,*tags)
		log('ERROR',message,tags.join(','))
	end
	
	def fatal(message,*tags)
		log('FATAL',message,tags.join(','))
	end

  end


 
