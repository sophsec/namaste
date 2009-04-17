def register_template(name)
  name = name.to_sym
  path = File.join('templates',"#{name}.erb")

  template(name) { File.read(path) }
end
