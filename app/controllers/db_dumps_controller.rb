require 'yaml_db'
require Rails.root + 'lib/zip_dir'
class DbDumpsController < ApplicationController
  DIR_PREFIX = Rails.root + 'tmp/dbdumps'
  basic_auth_config = {
    name: Rails.configuration.x.db_dump_user,
    password: Rails.configuration.x.db_dump_pw
  }
  puts "Basic auth #{basic_auth_config}"
  http_basic_authenticate_with(**basic_auth_config)

  def index
    @dir_contents = if Dir.exist?(DIR_PREFIX)
                      Dir.open(DIR_PREFIX).entries - %w[. ..]
                    else
                      ['no contents']
                    end
    @zip_files = Dir.open(Rails.root+'tmp').entries.filter {|str| }
  end

  def dump
    tmp_dir = tmp_name

    dumper = YamlDb::SerializationHelper::Base.new(YamlDb::Helper)
    dumper.dump_to_dir(tmp_dir)

    tmp_file = tmp_name + ".zip"
    zipper = ZipDir.new(tmp_dir, tmp_file)
    zipper.write

    send_file(File.join(tmp_file), filename: "db-#{unique_name}.zip")
  end

  private

  def tmp_name
    (DIR_PREFIX + unique_name).to_s
  end

  def unique_name
    @unique_name ||= DateTime.now.strftime('%Y%m%d-%H_%M_%S')
  end
end
