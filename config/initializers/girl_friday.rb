TAG_PROCESSOR = GirlFriday::WorkQueue.new(:tag_process, :size => 3) do |msg|
  Tag.process_tags(msg[:post_id])
end
