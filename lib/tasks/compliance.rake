require 'quickbase'
STATES_ARRAY = 
  ['AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 
   'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 
   'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 'NC', 'ND', 'NE', 
   'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'ORE', 'PA', 'PR',
   'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 
   'WV', 'WY']
namespace :compliance do
  desc "migrating data"
  task :generate_html => :environment do
    username = ENV['QUICKBASE_USERNAME']
    password = ENV['QUICKBASE_PASSWORD']
    org = ENV['QUICKBASE_ORG']
    app_token = ENV['QUICKBASE_APPTOKEN']
    compliance = Compliance::StateCompliance.new(username, password, org, app_token)

    STATES_ARRAY.each do |state|
      external_html, internal_html, modified_date = compliance.generate_html(state)
      puts modified_date
      create_state(state, external_html, internal_html)
    end  
  end

  def create_state(state, external_html, internal_html)
    ApplicationController.current_community = Community.first
    article = Article.current_community.find_by_subject(state)
      if article.blank?
        article = Article.current_community.new({subject: state, details: external_html,  author_id: 1, 
          author_type: 'Organization', content_identifier: state, internal_details: internal_html}, without_protection: true)
      else
        article.details = external_html 
        article.internal_details = internal_html
      end
    article.save!
  end
end
