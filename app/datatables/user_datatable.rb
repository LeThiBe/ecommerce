class UserDatatable < AjaxDatatablesRails::Base
  def sortable_columns
    @sortable_columns ||= ["User.name", "User.phone", "User.address", "User.email"]
  end

  def searchable_columns; end

  private

  def data
    records.map do |record|
      [
        record.name,
        record.phone,
        record.address,
        record.email,
        record.activated,
        record.is_admin
      ]
    end
  end

  def get_raw_records
    User.all
  end
end
