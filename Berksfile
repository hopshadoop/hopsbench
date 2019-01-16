# Start Bugfix: https://github.com/berkshelf/berkshelf-api/issues/112
Encoding.default_external = "UTF-8"
# End Bugfix

source "https://supermarket.chef.io"
metadata

cookbook "java"

cookbook "kagent", github: "maismail/kagent-chef", branch: "locDomainId"
cookbook "conda", github: "logicalclocks/conda-chef", branch: "0.7"
cookbook "kzookeeper", github: "logicalclocks/kzookeeper", branch: "0.7"
#cookbook "hadoop", github: "hopshadoop/apache-hadoop-chef", branch: "master"
cookbook "hops", github: "maismail/hops-hadoop-chef", branch: "locdomainId"
cookbook "ndb", github: "maismail/ndb-chef", branch: "locdomainId"
cookbook 'hopsmonitor', github: "logicalclocks/hopsmonitor-chef", branch: "0.7"
cookbook 'elastic', github: "logicalclocks/elasticsearch-chef", branch: "0.7"
