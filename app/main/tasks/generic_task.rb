class GenericTask < Volt::Task
  def script
    `ls`
  end
end
