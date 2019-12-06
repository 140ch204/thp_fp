class Project < ApplicationRecord
	belongs_to :organization
	belongs_to :city
	has_many :counterparts
	has_many :donations
	has_many :likes
	has_many :project_links
	has_many :admins, through: :organizations

	def in_progress_statut?
		if self.donation_targeted > 0
			"En cours de financement"
		else
			"Objectif atteint!"
		end
	end

	def in_progress_amount?
		amount = 0
		self.donations.each do |donation|
			amount += donation.donation_amount
		end
		return amount
	end

	def in_progress_percentages?
		percent = ( self.in_progress_amount?.to_f / self.donation_targeted.to_f ) * 100
		return (percent.to_f.is_a?(Float) && percent.to_f.nan?) ? 0 : percent.to_f.round(0)
	end

end
