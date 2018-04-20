require 'rho/rhocontroller'
require 'helpers/browser_helper'

class FixedSchemeModelController < Rho::RhoController
  include BrowserHelper

  @total_record_count = 0
  @filtered_record_count = 0
  @request_time = 0

  # GET /FixedSchemeModel
  def index
    @total_record_count = FixedSchemeModel.find(:count)
    start = Time.now
    @filtered_records = FixedSchemeModel.find(:all, :conditions => {'status' => '4'})
    @filtered_record_count = @filtered_records.size
    @request_time = Time.now - start
    render :back => '/app'
  end

  def delete_records
    FixedSchemeModel.delete_all
  end

  def create_records
    count = @params['count'].to_i
    (1..count).each do |each|
      status = Random.rand(10)
      FixedSchemeModel.create({'name' => "Name #{each}", 'status' => status})
    end
  end
end
