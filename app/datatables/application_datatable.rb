class ApplicationDatatable
  delegate :params, to: :@view
  delegate :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      recordsTotal: count,
      recordsFiltered: total_entries,
      data: data
    }
  end


private

  def page
    params[:start].to_i / per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  def sort_column
  # this code from https://github.com/driftingruby/082-datatables/blob/master/app/datatables/application_datatable.rb#L29
  # columns[params[:order]['0'][:column].to_i]
  # does not seem to work here. Trying to get the nested hash value returns an error. 
  # The order parameter from datatables get action looks like this:
  # "order"=>{"0"=>{"column"=>"0", "dir"=>"asc"}}
  # Since I use ruby 3.1.x, I changed the code to this since it has to do with unpermitted parameters
  columns[params.slice(:order).permit!.to_h.dig('order','0','column').to_i]
  
  end

  def sort_direction
    params.slice(:order).permit!.to_h.dig('order','0','dir').to_s == "desc" ? "desc" : "asc"
  end
end
