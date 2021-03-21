module WaitForAjax
  # ajaxが完了するまで待つ
  def wait_for_ajax(wait_time = Capybara.default_max_wait_time)
    Timeout.timeout(wait_time) do
      loop until finished_all_ajax_requests?
    end
    yield if block_given?
  end
end

RSpec.configure do |config|
  config.include WaitForAjax, type: :system
end