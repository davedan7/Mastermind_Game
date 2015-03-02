require 'bundler/setup'
require 'digitalocean'

module Provisioner
  class DO
    Digitalocean.client_id  = ENV['digital_ocean_client_id']
    Digitalocean.api_key    = ENV['digital_ocean_api_key']

    unless Digitalocean.client_id && Digitalocean.api_key
      raise "Need keys defined in ENV"
    end

    def size
      @size ||= Digitalocean::Size.all.sizes.detect{|s| s.name == "4GB"}
    end

    def image
      @image ||= Digitalocean::Image.all.images.detect{|i| i.slug == "ubuntu-14-04-x64"}
    end

    def region
      @region ||= Digitalocean::Region.all.regions.detect{|r| r.slug == "nyc1"}
    end

    def provision_server(name)
      Digitalocean::Droplet.create({:name => name,
                                    :size_id => size.id,
                                    :image_id => image.id,
                                    :region_id => region.id})
    end
  end
end
