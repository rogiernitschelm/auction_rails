module ControllerHelper
  def parsed(response)
    JSON.parse(response.body)
  end
end
