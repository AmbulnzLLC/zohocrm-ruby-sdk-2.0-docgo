# 6.2.0
## Bug Fixes:
* Fixed a bug in `src/api/util/converter.rb` causing noisy errors in log i.e. `<internal:pack>:8: warning: unknown pack directive '"' in '"C*"'`
* Removed the `mysql2` dependency from the gemspec as the mysql token store is optional
* Removed the unspecified `webrick` gem dependency which was only used for logging. Switched the `SDKLog::Log` class to use
  a standard Ruby `Logger` instead under the hood as the default logger. The default logging behavior and interface is unchanged.

## Enhancements:
* Custom Logger Support - Pass in a custom logger to `ZOHOCRMSDK::Initializer.initialize` - this now supports passing in `Rails.logger`, for instance
* Added `api_version` option to `ZOHOCRMSDK::Initializer.initialize` which defaults to `2`. This sets the crm API base path for operations from `/crm/v2/` to `/crm/v{version}/`