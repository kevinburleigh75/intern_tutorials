class CreateService
  def process(payload)
    payload[:names].each do |name|
      JunkRecord.create!(name: name)
    end
    { num_created: payload[:names].count }
  end
end
