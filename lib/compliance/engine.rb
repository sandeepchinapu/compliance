module Compliance
  class Engine < ::Rails::Engine
    isolate_namespace Compliance
    paths["lib"] << "lib"
  end
end
