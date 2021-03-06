require 'travis/api/app'

class Travis::Api::App
  class Endpoint
    class Builds < Endpoint
      get '/' do
        name = params[:branches] ? :find_branches : :find_builds
        params['ids'] = params['ids'].split(',') if params['ids'].respond_to?(:split)
        respond_with service(name, params)
      end

      get '/:id' do
        respond_with service(:find_build, params)
      end
    end
  end
end
