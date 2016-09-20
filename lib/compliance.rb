require 'quickbase'
require 'compliance/engine'
require 'compliance/fetch_data'
require 'compliance/fields_data'
module Compliance
	class Compliance::StateCompliance 
    # include Rails.application.routes.url_helpers 
    # include ActionView::Helpers::TagHelper
  
    def initialize(username, password, org, app_token)
      Quickbase::Connection.username = username
      Quickbase::Connection.password = password
      Quickbase::Connection.org = org
      @app_token = app_token
    end

    def generate_html(state)
      state_json = Compliance::FetchData.new.get_data(state, @app_token)
      date = latest_modified_date(state_json)
      html = render_view(state_json, state)
      split_into_external_internal(html, date)
    end

    def latest_modified_date(state_json)
      modified_date_array = []
      Compliance::FieldsData::DATE_ARRAY.each do |agency_table|
        state_json[agency_table.to_sym].each do |detail|
          modified_date_array << detail[:date_modified]
        end
      end
      modified_date_array.max
    end

    def render_view(state_json, state)
      av = ActionView::Base.new(Rails.root.join('compliance', 'lib', 'views'))
      av.assign({ state_json: state_json, state: state, fields_data: Compliance::FieldsData.field_data })
      av.render(template: 'compliance.html.haml') 
    end
    
    def split_into_external_internal(html, date)
      internal_only = ''
      dom = Nokogiri::HTML::DocumentFragment.parse(html)
      dom.search('internal').each_with_index do |internal_tag, index|
        internal_tag.set_attribute('id', "internal_#{index}")  
        internal_only << internal_tag.to_s;
        convert_to_internal_placeholder(internal_tag, index)
      end
      [dom.to_html, internal_only, date]
    end

    def convert_to_internal_placeholder(internal_tag, index)
      internal_tag.name = 'internal_placeholder'; 
      internal_tag.content = ''
    end 
  end
end
