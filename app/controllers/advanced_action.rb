class AdvancedAction
  def self.run(*args, **options)
    instance = if !options.empty?
      self.new(*args, **options)
    else
      self.new(*args)
    end

    instance.run

    instance
  end
end
