require 'Clientlogger'

describe Clientlogger do

	it "should log debug messages." do
		logger = Clientlogger.new("DEBUG","/tmp/demo.log","somekey")
		logger.debug("Debug test message","debugtag")
	end

	it "should log warn messages." do
                logger = Clientlogger.new("WARN","/tmp/demo.log","somekey")
                logger.warn("Warn test message","warntag")
        end

	it "should log info messages." do
                logger = Clientlogger.new("INFO","/tmp/demo.log","somekey")
                logger.info("Info test message","infotag")
        end

	it "should log error messages." do
                logger = Clientlogger.new("ERROR","/tmp/demo.log","somekey")
                logger.error("Error test message","errortag")
        end

	it "should log fatal messages." do
                logger = Clientlogger.new("FATAL","/tmp/demo.log","somekey")
                logger.fatal("Fatal test message","fataltag")
        end

	it "should discard log messages not with lower level than WARN." do
                logger = Clientlogger.new("WARN","/tmp/demo2.log","somekey")
                logger.debug("Debug test message 2","debugtag2")
		logger.warn("Warn test message 2","warntag2")
		logger.info("Info test message 2","infotag2")
		logger.error("Error test message 5","errortag5")
        end

	it "should discard log messages not with lower level than INFO." do
                logger = Clientlogger.new("INFO","/tmp/demo3.log","somekey")
                logger.debug("Debug test message 3","debugtag3")
                logger.warn("Warn test message 3","warntag3")
		logger.info("Info test message 3","infotag3")
		logger.fatal("Fatal test message 6","fataltag5")
        end

	it "should discard log messages not with lower level than ERROR." do
                logger = Clientlogger.new("ERROR","/tmp/demo5.log","somekey")
                logger.debug("Debug test message 5","debugtag5")
                logger.warn("Warn test message 5","warntag5")
		logger.info("Info test message 5","infotag5")
		logger.error("Error test message 5","errortag5")
		logger.fatal("Fatal test message 6","fataltag5")
        end

	it "should discard log messages not with lower level than FATAL." do
                logger = Clientlogger.new("FATAL","/tmp/demo6.log","somekey")
                logger.debug("Debug test message 6","debugtag6")
                logger.warn("Warn test message 6","warntag6")
		logger.info("Info test message 6","infotag6")
		logger.error("Error test message 6","errortag6")
		logger.fatal("Fatal test message 6","fataltag6")
        end

	it "should log messages with lower level than DEBUG." do
                logger = Clientlogger.new("DEBUG","/tmp/demo4.log","somekey")
                logger.debug("Debug test message 4","debugtag4")
                logger.warn("Warn test message 4","warntag4")
                logger.info("Info test message 4","infotag4")
                logger.error("Error test message 4","errortag4")
                logger.fatal("Fatal test message 4","fataltag4")
        end



end

