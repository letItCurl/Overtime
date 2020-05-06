module SmsTool
    def self.send_sms(number:, message:)
        puts "Sending SMS..."
        puts "to: #{number} , message:#{message}"
    end
end