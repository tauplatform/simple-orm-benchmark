require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PropertyBagModelController < Rho::RhoController
  include BrowserHelper

  @total_record_count = 0
  @filtered_record_count = 0
  @request_time = 0

  # GET /PropertyBagModel
  def index
    @total_record_count = PropertyBagModel.find(:count)
    start = Time.now
    @filtered_records = PropertyBagModel.find(:all, :conditions => {'status' => '4'})
    @filtered_record_count = @filtered_records.size
    @request_time = Time.now - start
    render :back => '/app'
  end

  # GET /PropertyBagModel/{1}
  def show
    @propertybagmodel = PropertyBagModel.find(@params['id'])
    if @propertybagmodel
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  def delete_records
    PropertyBagModel.delete_all
  end

  def create_records
    count = @params['count'].to_i
    (1..count).each do |each|
      status = Random.rand(10)
      PropertyBagModel.create({'name' => "Name #{each}", 'status' => status})
    end
  end

end
