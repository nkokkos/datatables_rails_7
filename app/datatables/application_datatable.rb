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
    columns[params.slice(:order).permit!.to_h.dig('order','0','column').to_i]
  end

  def sort_direction
    params.slice(:order).permit!.to_h.dig('order','0','dir').to_s == "desc" ? "desc" : "asc"
  end
end
