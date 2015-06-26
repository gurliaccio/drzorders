require 'httparty'

class Checkup < ActiveRecord::Base
  belongs_to :user

  validates :title, presence:true

  def self.search(current_user, gender, age)
    response = HTTParty.get "http://healthfinder.gov/developer/MyHFSearch.json?api_key=mslutnhngydkcsip&who=me&age=#{age}&gender=#{gender}"
    puts "Search result: #{response.body}"    
    checkups_hash = JSON.parse(response.body)
    checkups_hash["Result"]["Title"].map do |topic|
      Checkup.new(
        {
          title: topic["Title"],
          # description: topic["MyHFDescription"],
          user: current_user
        }
      )
    end
  end
end

