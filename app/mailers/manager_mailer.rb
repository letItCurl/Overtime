class ManagerMailer < ApplicationMailer
    def email manager
        @manager = manager
        mail(to: @manager.email, subject: "Daily overtime requests")
    end
end
