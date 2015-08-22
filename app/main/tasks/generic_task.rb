class GenericTask < Volt::Task
  def script
    ls
  end

  def ls
    `ls`
  end
end
