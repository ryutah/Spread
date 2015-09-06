require_relative 'modules/spread_module1'

class Spread
  include SpreadModule1

  attr_reader :row_num, :col_num, :inverse, :cells

  def initialize(row_num = 10, col_num = 10)
    @row_num = row_num
    @col_num = col_num

    @cells = init_cells
  end
end
