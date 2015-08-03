TABLE_REPLACEMENTS = {
  'opt_kinds' => 'option_kinds',
  'std_headers' => 'standard_headers',
  'ci_types' => 'types',
  'opt_headers' => 'option_headers',
  'mkt_class' => 'market_classes',
  'style_cats' => 'style_categories',
  'cons_info' => 'construction_infos',
  'norm_cons_info' => 'normalized_construction_infos',
  'norm_ci_labels' => 'labels',
  'tech_title_header' => 'tech_title_headers',
  'version' => 'versions'
}

COLUMN_REPLACEMENTS = {
  'market_classes.mkt_class_id' => 'id',
  'option_headers.header_id' => 'id',
  'option_headers.header' => 'text',
  'standard_headers.header_id' => 'id',
  'standard_headers.header' => 'text',
  'categories.header_id' => 'category_header_id',
  'standards.header_id' => 'standard_header_id',
  'options.header_id' => 'option_header_id',
  'options.kind_id' => 'option_kind_id',
  'styles.mkt_class_id' => 'market_class_id',
  'tech_specs.title_id' => 'tech_title_id',
  'tech_titles.header_id' => 'tech_header_id',
  'tech_titles.title_id' => 'tech_title_id',
  'tech_titles.title' => 'text'
}

namespace :db do
  desc "Create tables from Chrome CSV files"
  task :build_schema, [:path] => :environment do |_, args|
    path = File.join args[:path], '*.txt'
    files = Dir.glob path
    puts "#{files.length} files to process"

    files.each_with_index do |file, file_index|
      puts "\n#{file}"
      puts table_name = build_table_name(file)

      line = single_csv_line(file)

      puts cols = build_columns(line, table_name)
      cols['id'] = 0 unless cols.key?('id')

      # build_migration(file_index, table_name, cols)
      build_model(table_name, cols)
    end
  end

  desc "Populate tables from Chrome CSV files"
  task :load_data, [:path] => :environment do |_, args|
    path = File.join args[:path], '*.txt'
    files = Dir.glob path
    puts "#{files.length} files to process"

    # Sequel::Model.db.run('SET SESSION SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";')

    files.each do |file|
      puts "\n#{file}"
      puts table_name = build_table_name(file)
      puts klass = table_name.singularize.camelize.constantize

      line = single_csv_line(file)
      puts cols = build_columns(line, table_name)

      load_csv(file, cols.keys) do |lines_chunk|
        lines_chunk.each do |line|
          klass.create(line)
        end
      end
    end
  end
end

def build_table_name(file_name)
  table_name = File.basename(file_name).underscore[0..-5]
  table_name = TABLE_REPLACEMENTS[table_name] if TABLE_REPLACEMENTS.keys.include? table_name
  table_name
end

def load_csv(file, headers)
  SmarterCSV.process(file,
    :file_encoding => "iso-8859-1",
    :quote_char => '~',
    :downcase_header => false,
    :strings_as_keys => true,
    :remove_empty_values => false,
    :user_provided_headers => headers,
    :chunk_size => 100
  ) do |chunk|
    yield chunk
  end
end

def single_csv_line(file)
  line = nil
  SmarterCSV.process(file,
    :file_encoding => "iso-8859-1",
    :quote_char => '~',
    :downcase_header => false,
    :strings_as_keys => true,
    :remove_empty_values => false
  ) do |first_line|
    line = first_line
    break
  end
  line.first
end

def build_columns(line, table_name)
  Hash[ line.map do |k, v|
    key = k.underscore
    key = case key
          when %r{^#{table_name.singularize}_}
            key.gsub("#{table_name.singularize}_", '')
          when "#{table_name.singularize}"
            "text"
          else
            key
    end
    table_key = "#{table_name}.#{key}"
    key = COLUMN_REPLACEMENTS[table_key] if COLUMN_REPLACEMENTS.key?(table_key)

    [key, v]
  end]
end

# def build_defs(cols)
#   cols.map do |k, v|
#     if v.is_a?(String) && v.length > 100
#       puts "#{k}:#{v.class} - #{v.length}"
#       "      #{v.class} :#{k}, :size => 2000"
#     elsif k == 'id'
#       puts "#{k}:#{v.class} - #{v}"
#       "      primary_key :#{k}"
#     elsif k =~/_id$/
#       puts "#{k}:#{v.class} - #{v}"
#       "      #{v.class} :#{k}, :index => true"
#     else
#       puts "#{k}:#{v.class} - #{v}"
#       "      #{v.class} :#{k}"
#     end
#   end
# end

# def build_migration(file_index, table_name, cols)
#   col_defs = build_defs(cols)

#   migration_text = <<-EOF
# Sequel.migration do
#   change do
#     create_table :#{table_name} do
# #{col_defs.join("\n")}
#     end
#   end
# end
# EOF
#   File.open(Padrino.root + "/db/migrate/#{(file_index + 1).to_s.rjust(3, '0')}_#{table_name}.rb", 'w'){|f| f.write migration_text}
# end

def build_model(table_name, cols)
  model_name = table_name.singularize.camelize
  col_names = cols.map{|k, v| "  field :#{k}, :type => #{mongoid_class(v)}"}
  associations = cols.select{|k, v| k =~ /_id$/}.map{|k, v| "  belongs_to :#{k[0..-4]}"}

  model_text = <<-EOF
class #{model_name}
  include Mongoid::Document

#{col_names.join("\n")}

#{associations.join("\n")}
end
EOF
  File.open(Padrino.root + "/models/#{table_name.singularize}.rb", 'w'){|f| f.write model_text}
end

def mongoid_class(obj)
  case obj
  when Fixnum
    Integer
  else
    obj.class
  end
end