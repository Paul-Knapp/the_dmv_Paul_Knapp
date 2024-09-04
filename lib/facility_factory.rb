class Facility_Factory
    def create_facilities(sources)
      sources.map do |source|
          facility = Facility.new({
            name: source[:dmv_office],
            phone: source[:phone],
            address:
            "#{source[:address_li]} #{source[:address__1]} #{source[:city]} #{source[:state]} #{source[:zip]}"})
      end
    end
  end