# Start Bugfix: https://github.com/berkshelf/berkshelf-api/issues/112
Encoding.default_external = "UTF-8"
# End Bugfix

source "https://supermarket.chef.io"
metadata

cookbook "java"

cookbook "kagent", github: "logicalclocks/kagent-chef", branch: "master"
cookbook "conda", github: "logicalclocks/conda-chef", branch: "master"
cookbook "kzookeeper", github: "logicalclocks/kzookeeper", branch: "master"
#cookbook "hadoop", github: "hopshadoop/apache-hadoop-chef", branch: "master"
cookbook "hops", github: "maismail/hops-hadoop-chef", branch: "locdomainId"
cookbook "ndb", github: "maismail/ndb-chef", branch: "locdomainId"
cookbook 'hopsmonitor', github: "logicalclocks/hopsmonitor-chef", branch: "master"
cookbook 'elastic', github: "logicalclocks/elasticsearch-chef", branch: "master"
