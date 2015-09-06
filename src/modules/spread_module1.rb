module SpreadModule1

  def get(row, col)
    return nil unless valid? row, col
    first_index, second_index = @inverse ? [col, row] : [row, col]
    @cells[first_index][second_index]
  end

  def set(row, col, obj)
    return nil unless valid? row, col
    first_index, second_index = @inverse ? [col, row] : [row, col]
    @cells[first_index][second_index] = obj
  end

  def delete(row, col)
    return nil unless valid? row, col
    first_index, second_index = @inverse ? [col, row] : [row, col]
    @cells[first_index][second_index] = nil
  end

  def get_row(index)
    @inverse ? @cell.transpose[index] : @cell[index]
  end

  def get_col(index)
    @inverse ? @cell[index] : @cell.transpose[index]
  end

  def insert_row(index, row = nil)
    row ||= Array.new row_num
    return nil if row.count != row_num

    @row_num += 1
    @cells.transpose and @inverse = !@inverse if @inverse
    @cells.insert index, row
  end

  def insert_col(index, col = nil)
    col ||= Array.new col_num
    return nil if col.count != col_num

    @col_num += 1
    @cells.transpose and @inverse = !@inverse unless @inverse
    @cells.insert index, col
  end

  def delete_row(index)
    return nil if index >= row_num || index < 0

    @row_num -= 1
    @cells.transpose and @inverse = !@inverse if @inverse
    @cells.delete_at index
  end

  def delete_col(index)
    return nil if index >= col_num || index < 0

    @col_num -= 1;
    @cells.transpose and @inverse = !@inverse unless @inverse
    cells.delete_at index
  end

  def clear
    @cells = init_cells
  end

  def resize(row, col)
  end

  private
  def init_cells
    @inverse = false
    cell = []
    @row_num.times do |r|
      cell[r] = Array.new [col_num]
    end
    cell
  end

  def valid?(row, col)
    row < @row_num && col < @col_num
  end
end
