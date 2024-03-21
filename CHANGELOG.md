# 6.2.0
## Bug Fixes:
* Fixed a bug in `src/api/util/converter.rb` causing noisy errors in log i.e. `<internal:pack>:8: warning: unknown pack directive '"' in '"C*"'`
* Removed the `mysql2` dependency from the gemspec as the mysql token store is optional
* Removed the unspecified Webrick dependency which is required only if using the built in default file system logger
  (see Custom Logger Support enhancement)

## Enhancements:
* Custom Logger Support - Pass in a custom logger to `ZOHOCRMSDK::Initializer.initialize` - this supports passing in `Rails.logger`, for instance
* Added `api_version` option to `ZOHOCRMSDK::Initializer.initialize` which defaults to `2`. This sets the crm API base path for operations from `/crm/v2/` to `/crm/v{version}/`