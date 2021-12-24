require "test_helper"

class AppointMailerTest < ActionMailer::TestCase
  test "appoint" do
    mail = AppointMailer.appoint
    assert_equal "Appoint", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
