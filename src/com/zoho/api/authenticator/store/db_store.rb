require_relative 'token_store'
require_relative '../oauth_token'
require_relative '../../../crm/api/util/constants'

module ZOHOCRMSDK
  module Store
    # This class stores the user token details to the MySQL DataBase.
    class DBStore < TokenStore
      attr_reader :user_name, :password, :port_number, :host, :database_name, :table_name

      # Creates an DBStore class instance with the specified parameters.
      # @param host [string] A String containing the DataBase host name.
      # @param database_name A String containing the DataBase name.
      # @param table_name A String containing the table name.
      # @param user_name A String containing the DataBase user name.
      # @param password A String containing the DataBase password.
      # @param port_number A String containing the DataBase port number.
      def initialize(host: Constants::MYSQL_HOST, database_name: Constants::MYSQL_DATABASE_NAME ,table_name: Constants::MYSQL_TABLE_NAME,user_name: Constants::MYSQL_USER_NAME,password: '',port_number: Constants::MYSQL_PORT_NUMBER )
        require 'mysql2' unless const_defined?(:Mysql2)

        @host = host
        @database_name = database_name
        @table_name = table_name
        @user_name = user_name
        @password = password
        @port_number = port_number
      end

      def get_token(user, token)
        con = Mysql2::Client.new(host: @host, username: @user_name, password: @password, database: @database_name, port: @port_number)

        query = construct_db_query(user.email, token, false)

        rs = con.query(query)

        con.close

        rs.each do |row|
          oauthtoken = token

          oauthtoken.client_id = row[Constants::CLIENT_ID]

          oauthtoken.client_secret = row[Constants::CLIENT_SECRET]

          oauthtoken.grant_token = row[Constants::GRANT_TOKEN]

          oauthtoken.redirect_url = row[Constants::REDIRECT_URL]

          oauthtoken.refresh_token = row[Constants::REFRESH_TOKEN]

          oauthtoken.id = row[Constants::ID]

          oauthtoken.user_mail = row[Constants::USER_MAIL]

          oauthtoken.access_token = row[Constants::ACCESS_TOKEN]

          oauthtoken.expires_in = row[Constants::EXPIRY_TIME]

          return oauthtoken
        end
        nil
      rescue Mysql2::Error => e
        raise SDKException.new(Constants::TOKEN_STORE, Constants::GET_TOKEN_DB_ERROR, nil, e)
      end

      def save_token(user, token)
        con = Mysql2::Client.new(host: @host, username: @user_name, password: @password, database: @database_name, port: @port_number)
        if token.is_a? Authenticator::OAuthToken
          query = "insert into #{token.table_name}(id,user_mail,client_id,client_secret,refresh_token,access_token,grant_token,expiry_time,redirect_url) values ('#{token.id}','#{user.email}','#{token.client_id}','#{token.client_secret}','#{token.refresh_token}','#{token.access_token}','#{token.grant_token}','#{token.expires_in}','#{token.redirect_url}')"
          token.user_mail = user.email
          delete_token(token)
          con.query(query)
        end

        con.close
      rescue Mysql2::Error => e
        raise SDKException.new(Constants::TOKEN_STORE, Constants::SAVE_TOKEN_DB_ERROR, nil, e)
      end

      def delete_token(token)
        con = Mysql2::Client.new(host: @host, username: @user_name, password: @password, database: @database_name, port: @port_number)
        if token.is_a? Authenticator::OAuthToken
          query = construct_db_query(token.user_mail, token, true)

          con.query(query)
        end

        con.close
      rescue Mysql2::Error => e
        raise SDKException.new(Constants::TOKEN_STORE, Constants::DELETE_TOKEN_DB_ERROR, nil, e)
      end

      def delete_tokens
        con = Mysql2::Client.new(host: @host, username: @user_name, password: @password, database: @database_name, port: @port_number)

        query = "delete * from #{@table_name}"

        con.query(query)

        con.close
      rescue Mysql2::Error => e
        raise SDKException.new(Constants::TOKEN_STORE, Constants::DELETE_TOKENS_DB_ERROR, nil, e)
      end

      def get_tokens
        tokens = []
        con = Mysql2::Client.new(host: @host, username: @user_name, password: @password, database: @database_name, port: @port_number)

        query = "select * from #{@table_name}"

        rs = con.query(query)

        con.close

        rs.each do |row|


          oauthtoken = Authenticator::OAuthToken.new(client_id: row[Constants::CLIENT_ID],client_secret: row[Constants::CLIENT_SECRET],grant_token: grant_token,refresh_token: row[Constants::REFRESH_TOKEN])

          oauthtoken.id = row[Constants::ID]

          oauthtoken.user_mail = row[Constants::USER_MAIL]

          oauthtoken.access_token = row[Constants::ACCESS_TOKEN]

          oauthtoken.redirect_url = row[Constants::REDIRECT_URL]

          oauthtoken.expires_in = row[Constants::EXPIRY_TIME]

          tokens.push(oauthtoken)
        end
        tokens
      rescue Mysql2::Error => e
        raise SDKException.new(Constants::TOKEN_STORE, Constants::GET_TOKENS_DB_ERROR, nil, e)
      end

      def construct_db_query(email, token, is_delete)
        raise SDKException.new(Constants::USER_MAIL_NULL_ERROR, Constants::USER_MAIL_NULL_ERROR_MESSAGE) if email.nil?

        query = is_delete ? 'delete from ' : 'select * from '

        query += "#{@table_name} where user_mail='#{email}' and client_id='#{token.client_id}' and "

        query += if token.grant_token.nil?
                  "refresh_token='#{token.refresh_token}'"
                else
                  "grant_token='#{token.grant_token}'"
                end

        query
      end
      def get_token_by_id(id,token)
        con = Mysql2::Client.new(host: @host, username: @user_name, password: @password, database: @database_name, port: @port_number)
        
        if token.is_a? Authenticator::OAuthToken
          query = "select * from #{@table_name} where id='#{id}'" 

          rs = con.query(query)

          con.close

          rs.each do |row|
            if id == row[Constants::ID]
              oauthtoken = token

              oauthtoken.client_id = row[Constants::CLIENT_ID]

              oauthtoken.client_secret = row[Constants::CLIENT_SECRET]

              oauthtoken.grant_token = row[Constants::GRANT_TOKEN]

              oauthtoken.redirect_url = row[Constants::REDIRECT_URL]

              oauthtoken.refresh_token = row[Constants::REFRESH_TOKEN]

              oauthtoken.id = row[Constants::ID]

              oauthtoken.user_mail = row[Constants::USER_MAIL]

              oauthtoken.access_token = row[Constants::ACCESS_TOKEN]

              oauthtoken.expires_in = row[Constants::EXPIRY_TIME]

              return oauthtoken
            end
          end
        end
        nil
      rescue Mysql2::Error => e
        raise SDKException.new(Constants::TOKEN_STORE, Constants::GET_TOKEN_BY_ID_DB_ERROR, nil, e)
      end
    end
  end
end