class CreateService
  def process(payload)
    num_created = ActiveRecord::Base.transaction(isolation: :repeatable_read, requires_new: true) do
      junk_records = payload[:names].map { |name|
        JunkRecord.new(name: name)
      }
      result = JunkRecord.import(junk_records, on_duplicate_key_ignore: true)
      result.ids.count
    end
    { num_created: num_created }
  end
end
