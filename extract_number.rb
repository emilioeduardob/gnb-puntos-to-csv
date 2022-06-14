class ExtractNumber
  def initialize(column_name)
    @column_name = column_name
  end

  def process(row)
    row[@column_name] = row[@column_name].gsub(/[^\d]/, '') if row[@column_name]
    row
  end
end