class ::String
  def camelize
    split("_").map { |part|
      part[0] = part[0].upcase
      part
    }.join
  end

  def constantize
    split('::').inject(Kernel, &:const_get)
  end
end