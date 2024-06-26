require_relative '../header'
require_relative '../header_map'
require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/utility'
require_relative '../util/constants'

module ZOHOCRMSDK
  module RelatedRecords
    class RelatedRecordsOperations

        # Creates an instance of RelatedRecordsOperations with the given parameters
        # @param related_list_api_name [String] A String
        # @param module_api_name [String] A String
        # @param x_external [String] A String
      def initialize(related_list_api_name, module_api_name, x_external=nil)
        if !related_list_api_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: related_list_api_name EXPECTED TYPE: String', nil, nil)
        end
        if !module_api_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_api_name EXPECTED TYPE: String', nil, nil)
        end
        if x_external!=nil and !x_external.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: x_external EXPECTED TYPE: String', nil, nil)
        end
        @related_list_api_name = related_list_api_name
        @module_api_name = module_api_name
        @x_external = x_external
      end

        # The method to get related records
        # @param record_id [Integer] A Integer
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @param header_instance [HeaderMap] An instance of HeaderMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_related_records(record_id, param_instance=nil, header_instance=nil)
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        if header_instance!=nil and !header_instance.is_a? HeaderMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: header_instance EXPECTED TYPE: HeaderMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + record_id.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordsHeader'), @x_external)
        handler_instance.param = param_instance
        handler_instance.header = header_instance
        Util::Utility.get_related_lists(@related_list_api_name, @module_api_name, handler_instance)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to update related records
        # @param record_id [Integer] A Integer
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_related_records(record_id, request)
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + record_id.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.UpdateRelatedRecordsHeader'), @x_external)
        Util::Utility.get_related_lists(@related_list_api_name, @module_api_name, handler_instance)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to delink records
        # @param record_id [Integer] A Integer
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def delink_records(record_id, param_instance=nil)
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + record_id.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.DelinkRecordsHeader'), @x_external)
        handler_instance.param = param_instance
        Util::Utility.get_fields(@module_api_name, handler_instance)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to get related records using external id
        # @param external_value [String] A String
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @param header_instance [HeaderMap] An instance of HeaderMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_related_records_using_external_id(external_value, param_instance=nil, header_instance=nil)
        if !external_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: external_value EXPECTED TYPE: String', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        if header_instance!=nil and !header_instance.is_a? HeaderMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: header_instance EXPECTED TYPE: HeaderMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + external_value.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordsUsingExternalIDHeader'), @x_external)
        handler_instance.param = param_instance
        handler_instance.header = header_instance
        Util::Utility.get_related_lists(@related_list_api_name, @module_api_name, handler_instance)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to update related records using external id
        # @param external_value [String] A String
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_related_records_using_external_id(external_value, request)
        if !external_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: external_value EXPECTED TYPE: String', nil, nil)
        end
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + external_value.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.UpdateRelatedRecordsUsingExternalIDHeader'), @x_external)
        Util::Utility.get_related_lists(@related_list_api_name, @module_api_name, handler_instance)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to delete related records using external id
        # @param external_value [String] A String
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def delete_related_records_using_external_id(external_value, param_instance=nil)
        if !external_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: external_value EXPECTED TYPE: String', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + external_value.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.DeleteRelatedRecordsUsingExternalIDHeader'), @x_external)
        handler_instance.param = param_instance
        Util::Utility.get_related_lists(@related_list_api_name, @module_api_name, handler_instance)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to get related record
        # @param related_record_id [Integer] A Integer
        # @param record_id [Integer] A Integer
        # @param header_instance [HeaderMap] An instance of HeaderMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_related_record(related_record_id, record_id, header_instance=nil)
        if !related_record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: related_record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if header_instance!=nil and !header_instance.is_a? HeaderMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: header_instance EXPECTED TYPE: HeaderMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + record_id.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + related_record_id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordHeader'), @x_external)
        handler_instance.header = header_instance
        Util::Utility.get_related_lists(@related_list_api_name, @module_api_name, handler_instance)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to update related record
        # @param related_record_id [Integer] A Integer
        # @param record_id [Integer] A Integer
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_related_record(related_record_id, record_id, request)
        if !related_record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: related_record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + record_id.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + related_record_id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.UpdateRelatedRecordHeader'), @x_external)
        Util::Utility.get_related_lists(@related_list_api_name, @module_api_name, handler_instance)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to delink record
        # @param related_record_id [Integer] A Integer
        # @param record_id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def delink_record(related_record_id, record_id)
        if !related_record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: related_record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + record_id.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + related_record_id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.DelinkRecordHeader'), @x_external)
        Util::Utility.get_fields(@module_api_name, handler_instance)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to get related record using external id
        # @param external_field_value [String] A String
        # @param external_value [String] A String
        # @param header_instance [HeaderMap] An instance of HeaderMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_related_record_using_external_id(external_field_value, external_value, header_instance=nil)
        if !external_field_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: external_field_value EXPECTED TYPE: String', nil, nil)
        end
        if !external_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: external_value EXPECTED TYPE: String', nil, nil)
        end
        if header_instance!=nil and !header_instance.is_a? HeaderMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: header_instance EXPECTED TYPE: HeaderMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + external_value.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + external_field_value.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordUsingExternalIDHeader'), @x_external)
        handler_instance.header = header_instance
        Util::Utility.get_related_lists(@related_list_api_name, @module_api_name, handler_instance)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to update related record using external id
        # @param external_field_value [String] A String
        # @param external_value [String] A String
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_related_record_using_external_id(external_field_value, external_value, request)
        if !external_field_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: external_field_value EXPECTED TYPE: String', nil, nil)
        end
        if !external_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: external_value EXPECTED TYPE: String', nil, nil)
        end
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + external_value.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + external_field_value.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.UpdateRelatedRecordUsingExternalIDHeader'), @x_external)
        Util::Utility.get_related_lists(@related_list_api_name, @module_api_name, handler_instance)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to delete related record using external id
        # @param external_field_value [String] A String
        # @param external_value [String] A String
        # @return An instance of APIResponse
      # @raise SDKException
      def delete_related_record_using_external_id(external_field_value, external_value)
        if !external_field_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: external_field_value EXPECTED TYPE: String', nil, nil)
        end
        if !external_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: external_value EXPECTED TYPE: String', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + "/crm/v#{Initializer.get_initializer.api_version}/"
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + external_value.to_s
        api_path = api_path + '/'
        api_path = api_path + @related_list_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + external_field_value.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.add_header(Header.new('X-EXTERNAL', 'com.zoho.crm.api.RelatedRecords.DeleteRelatedRecordUsingExternalIDHeader'), @x_external)
        Util::Utility.get_related_lists(@related_list_api_name, @module_api_name, handler_instance)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

      class GetRelatedRecordsHeader
          @@If_modified_since =   Header.new('If-Modified-Since', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordsHeader')
        def self.If_modified_since
          @@If_modified_since
        end
      end

      class GetRelatedRecordsParam
          @@page =   Param.new('page', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordsParam')
        def self.page
          @@page
        end
          @@per_page =   Param.new('per_page', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordsParam')
        def self.per_page
          @@per_page
        end
      end

      class UpdateRelatedRecordsHeader
      end

      class DelinkRecordsHeader
      end

      class DelinkRecordsParam
          @@ids =   Param.new('ids', 'com.zoho.crm.api.RelatedRecords.DelinkRecordsParam')
        def self.ids
          @@ids
        end
      end

      class GetRelatedRecordsUsingExternalIDHeader
          @@If_modified_since =   Header.new('If-Modified-Since', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordsUsingExternalIDHeader')
        def self.If_modified_since
          @@If_modified_since
        end
      end

      class GetRelatedRecordsUsingExternalIDParam
          @@page =   Param.new('page', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordsUsingExternalIDParam')
        def self.page
          @@page
        end
          @@per_page =   Param.new('per_page', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordsUsingExternalIDParam')
        def self.per_page
          @@per_page
        end
      end

      class UpdateRelatedRecordsUsingExternalIDHeader
      end

      class DeleteRelatedRecordsUsingExternalIDHeader
      end

      class DeleteRelatedRecordsUsingExternalIDParam
          @@ids =   Param.new('ids', 'com.zoho.crm.api.RelatedRecords.DeleteRelatedRecordsUsingExternalIDParam')
        def self.ids
          @@ids
        end
      end

      class GetRelatedRecordHeader
          @@If_modified_since =   Header.new('If-Modified-Since', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordHeader')
        def self.If_modified_since
          @@If_modified_since
        end
      end

      class UpdateRelatedRecordHeader
      end

      class DelinkRecordHeader
      end

      class GetRelatedRecordUsingExternalIDHeader
          @@If_modified_since =   Header.new('If-Modified-Since', 'com.zoho.crm.api.RelatedRecords.GetRelatedRecordUsingExternalIDHeader')
        def self.If_modified_since
          @@If_modified_since
        end
      end

      class UpdateRelatedRecordUsingExternalIDHeader
      end

      class DeleteRelatedRecordUsingExternalIDHeader
      end

    end
  end
end
