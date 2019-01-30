require 'chef/knife'
require 'aws-sdk'

module Engine
  module DengineClientBase

    def self.included(includer)
      includer.class_eval do

#---------------------Client initiation for AWS-------------------------

      def aws_connection_client
        @aws_connection_client ||= begin
          aws_connection_client = Aws::EC2::Client.new(
                 region: Chef::Config[:knife][:region],
                 credentials: Aws::Credentials.new(Chef::Config[:knife][:aws_access_key_id], Chef::Config[:knife][:aws_secret_access_key]))
        end
      end

      def aws_connection_resource
        aws_connection_resource ||= begin
          Aws.config.update({credentials: Aws::Credentials.new(Chef::Config[:knife][:aws_access_key_id], Chef::Config[:knife][:aws_secret_access_key])})
        aws_connection_resource = Aws::EC2::Resource.new(region: Chef::Config[:knife][:region])
        end
      end

      def aws_connection_elb
        @aws_connection_elb ||= begin
          aws_connection_elb = Aws::ElasticLoadBalancing::Client.new(
                 region: Chef::Config[:knife][:region],
                 credentials: Aws::Credentials.new(Chef::Config[:knife][:aws_access_key_id], Chef::Config[:knife][:aws_secret_access_key]))
            end
      end

      def aws_connection_elb2
        @aws_connection_elb2 ||= begin
          aws_connection_elb2 = Aws::ElasticLoadBalancingV2::Client.new(
                 region: Chef::Config[:knife][:region],
                 credentials: Aws::Credentials.new(Chef::Config[:knife][:aws_access_key_id], Chef::Config[:knife][:aws_secret_access_key]))
          end
      end

      def aws_autoscaling_client
        @aws_autoscaling_client ||= begin
          aws_autoscaling_client = Aws::AutoScaling::Client.new(
                 region: Chef::Config[:knife][:region],
                 credentials: Aws::Credentials.new(Chef::Config[:knife][:aws_access_key_id], Chef::Config[:knife][:aws_secret_access_key]))
        end
      end

      def aws_pricing_list
        @aws_pricing_list ||= begin
          aws_pricing_list = Aws::Pricing::Client.new(
                 region: Chef::Config[:knife][:region],
                 credentials: Aws::Credentials.new(Chef::Config[:knife][:aws_access_key_id], Chef::Config[:knife][:aws_secret_access_key]))
        end
      end

#------------------------------Client initiation for GOOGLE------------------------


      def google_connection_api
        return @google_connection_api unless @google_connection_api.nil?

        @google_connection_api = Google::Apis::ComputeV1::ComputeService.new
        @google_connection_api.google_api_authorization = google_api_authorization
        @google_connection_api.client_options = Google::Apis::ClientOptions.new.tap do |opts|
          opts.application_name    = "knife-google"
          opts.application_version = Knife::Google::VERSION
        end

        @google_connection_api
      end

      def google_api_authorization
        @google_api_authorization ||= Google::Auth.get_application_default(
          [
            "https://www.googleapis.com/auth/cloud-platform",
            "https://www.googleapis.com/auth/compute"
          ]
        )
      end

#------------------------------------------------------------------------------------------
    end
  end
end
end
