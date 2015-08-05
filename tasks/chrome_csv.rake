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
  'tech_titles.header_id' => 'tech_title_header_id',
  'tech_titles.title_id' => 'tech_title_id',
  'tech_titles.title' => 'text'
}

namespace :db do
  desc "Create tables from Chrome CSV files"
  task :build_schema, [:path] => :environment do |_, args|
    path = File.join args[:path], '*.txt'
    files = Dir.glob path
    puts "#{files.length} files to process"

    files.each do |file|
      puts "\n#{file}"
      puts table_name = build_table_name(file)

      line = single_csv_line(file)

      puts cols = build_columns(line, table_name)

      build_model(table_name, cols)
    end
  end

  desc "Populate tables from Chrome CSV files"
  task :load_data, [:path] => :environment do |_, args|
    Moped.logger = Logger.new($stdout)
    Moped.logger.level = Logger::DEBUG

    path = File.join args[:path], '*.txt'
    files = Dir.glob path
    puts "#{files.length} files to process"

    files.each do |file|
      puts "\n#{file}"
      puts table_name = build_table_name(file)
      puts klass = build_ns_class_name(table_name).constantize

      line = single_csv_line(file)
      puts headers = build_columns(line, table_name).keys

      load_csv(file, headers).each do |line|
        line.delete_if{|k, v| v.blank?}

        klass.find_or_create_by(line)
      end
    end
  end
end

def module_name
  "Chrome"
end

def build_table_name(file_name)
  table_name = File.basename(file_name).underscore[0..-5]
  table_name = TABLE_REPLACEMENTS[table_name] if TABLE_REPLACEMENTS.keys.include? table_name
  table_name
end

def build_class_name(table_name)
  table_name.singularize.camelize
end

def build_ns_class_name(table_name)
  "#{module_name}::#{build_class_name(table_name)}"
end

def load_csv(file, headers)
  puts "reading #{file}..."
  csv = SmarterCSV.process(file,
    :file_encoding => "iso-8859-1",
    :quote_char => '~',
    :downcase_header => false,
    :strings_as_keys => true,
    :remove_empty_values => false,
    :user_provided_headers => headers
  )
  puts "#{file} loaded."
  csv
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

def build_model(table_name, cols)
  path = Padrino.root + "/models/#{module_name.downcase}"
  model_name = build_class_name(table_name)
  file_name = model_name.underscore
  col_names = cols.map{|k, v| "    field :#{k}, :type => #{mongoid_class(v)}"}
  association_cols = cols.select{|k, v| k =~ /_id$/ && k !~ /hist_|auto_builder/}
  associations = association_cols.map{|k, v| "    belongs_to :#{k[0..-4]}"}
  indexes = association_cols.map{|k, v| "    index({:#{k} => 1})"}

  FileUtils.mkdir_p(path)

  model_text = <<-EOF
module #{module_name}
  class #{model_name}
    include Mongoid::Document

#{col_names.join("\n")}

#{associations.join("\n")}

#{indexes.join("\n")}
  end
end
EOF

  File.open("#{path}/#{file_name}.rb", 'w'){|f| f.write model_text}
end

def mongoid_class(obj)
  case obj
  when Fixnum
    Integer
  else
    obj.class
  end
end
