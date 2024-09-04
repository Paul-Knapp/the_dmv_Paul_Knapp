class Facility_Factory
    def create_facilities(sources)
      sources.map do |source|
          facility = Facility.new({
            name: source[:dmv_office] || source[:office_name],
            phone: source[:phone] || source[:public_phone_number],
            address: address(source)})
      end
    end

    def address(source)
        address_parsed = {
            address_ln1: [:address_li, :street_address_line_1, :address1],
            address_ln2: [:address__1, :street_address_line_2],
            address_ln3: [:city],
            address_ln4: [:state],
            address_ln5: [:zip, :zip_code, :zipcode]
                }
        address_bits = []
        
        address_parsed.map do |_,keys|
                   matching_key = keys.find do |key|
                    source[key] if source.key?(key)
                end

                if matching_key
                    value = source[matching_key]
                    address_bits << value if value
                end
        end
        address_bits.join(' ')
    end
  end