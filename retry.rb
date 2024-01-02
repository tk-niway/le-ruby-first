retry_attempts = 3

retry_attempts.times do |attempt|
  begin
    raise "例外発生 #{attempt}回目 retry_attempts:#{retry_attempts}"
  rescue StandardError => e
    puts e.message
    if attempt < retry_attempts - 1
      sleep(2**attempt)
      retry
    else
      raise "リトライ回数を超えました:#{e.message}"
    end
  end
end