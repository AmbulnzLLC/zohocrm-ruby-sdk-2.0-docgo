require_relative '../param'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module RelatedLists
    class RelatedListsOperations

        # Creates an instance of RelatedListsOperations with the given parameters
        # @param module_1 [String] A String
      def initialize(module_1=nil)
        if module_1!=nil and !module_1.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_1 EXPECTED TYPE: String', nil, nil)
        end
        @module_1 = module_1
      end

        # The method to get related lists
        # @return An instance of APIResponse
      # @raise SDKException
      def get_related_lists
        handler_instance = Handler::CommonAPIHandler.new
        api_path = "/crm/v#{Initializer.get_initializer.api_version}/settings/related_lists"
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.RelatedLists.GetRelatedListsParam'), @module_1)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to get related list
        # @param id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def get_related_list(id)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = "/crm/v#{Initializer.get_initializer.api_version}/settings/related_lists/"
        api_path = api_path + id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.RelatedLists.GetRelatedListParam'), @module_1)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

      class GetRelatedListsParam
      end

      class GetRelatedListParam
      end

    end
  end
end
