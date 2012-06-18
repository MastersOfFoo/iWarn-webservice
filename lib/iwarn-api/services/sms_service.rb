class SmsService
  def initialize(number, message)
    @number, @message = number, message
  end

  def deliver
    sms = Moonshado::Sms.new(@number, @message)
    sms.deliver_sms
  end
end
