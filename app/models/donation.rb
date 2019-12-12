class Donation < ApplicationRecord
	belongs_to :counterpart, optional: true
	belongs_to :organization
  belongs_to :project
  validates :donation_amount, numericality: true, presence: true

  after_create :thanks_for_donation_send, :donation_received_send

  def thanks_for_donation_send
    UserMailer.thanks_for_donation_email(self).deliver_now
  end

  def donation_received_send
    UserMailer.donation_received_email(self).deliver_now
  end
end
