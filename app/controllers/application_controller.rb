class ApplicationController < ActionController::Base
    def generate_cache_key(prefix, params)
        key = [prefix]
        key.concat(params.values) if params.present?
        key.join('/')
    end
end
