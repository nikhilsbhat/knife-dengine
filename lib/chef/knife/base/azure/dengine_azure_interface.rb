require "#{File.dirname(__FILE__)}/custom_errors"
require "#{File.dirname(__FILE__)}/helpers"


module Azure
  class DengineAzureInterface
    include CustomErrors
    include Helpers

    attr_accessor :ui

    def initialize(options = {})
    end

    def create_server(params = {})
      AzureInterface.api_not_implemented(self)
    end

    def list_servers
      AzureInterface.api_not_implemented(self)
    end

    def delete_server(server_name)
      AzureInterface.api_not_implemented(self)
    end

    def list_images
      AzureInterface.api_not_implemented(self)
    end

    def show_server(server_name, resource_group = "")
      AzureInterface.api_not_implemented(self)
    end

    def create_vnet(params = {})
      AzureInterface.api_not_implemented(self)
    end

    def list_vnets
      AzureInterface.api_not_implemented(self)
    end

    def list_internal_lb
      AzureInterface.api_not_implemented(self)
    end

    def create_internal_lb(params = {})
      AzureInterface.api_not_implemented(self)
    end

    def list_affinity_groups
      AzureInterface.api_not_implemented(self)
    end

    def create_affinity_group(params = {})
      AzureInterface.api_not_implemented(self)
    end

    def find_server(server_name)
      AzureInterface.api_not_implemented(self)
    end
  end
end
