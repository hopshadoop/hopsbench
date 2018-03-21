# Start Bugfix: https://github.com/berkshelf/berkshelf-api/issues/112
Encoding.default_external = "UTF-8"
# End Bugfix

source "https://supermarket.chef.io"
metadata

cookbook "java"

cookbook "kagent", github: "hopshadoop/kagent-chef", branch: "master"
cookbook "conda", github: "hopshadoop/conda-chef", branch: "master"
cookbook "kzookeeper", github: "hopshadoop/kzookeeper", branch: "master"
#cookbook "hadoop", github: "hopshadoop/apache-hadoop-chef", branch: "master"
cookbook "hops", github: "hopshadoop/hops-hadoop-chef", branch: "master"
cookbook "ndb", github: "hopshadoop/ndb-chef", branch: "master"
cookbook "ark"
