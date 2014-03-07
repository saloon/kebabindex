module ApplicationHelper
  def current_location
    if request.location.city.present?
      s = Geocoder.search(request.location.city)
      if s[0].present?
        return [s[0].latitude, s[0].longitude]
      end
    end
    # Vienna
    [48.208273, 16.373853]
  end

  def json_for(target, options = {})
    options[:scope] ||= self
    options[:url_options] ||= url_options
    target.active_model_serializer.new(target, options).to_json
  end
end
