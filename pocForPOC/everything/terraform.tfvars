managementResourceGroup = {
  location = "Uk South"
  name = "manage"
}

networksResourceGroup = {
  location = "Uk South"
  name = "network"
}

sql_Server = {
  name = "sqlserver12jp"
  version = "12.0"
}

databases = [ {
  name = "db1"
  edition = "Standard"
  collation = "SQL_LATIN1_GENERAL_CP1_CI_AS"
},
{
  name = "db2"
  edition = "Standard"
  collation = "SQL_LATIN1_GENERAL_CP1_CI_AS"
}  ]

apps = [{
  name = "app27jp234"
  app_settings = {"SOME_KEY" = "some-value"}
  },
  {
  name = "app28jp2334"
    app_settings = {}
  }
]

service_Bus_Topics = [ {
  name = "joestopic"
  enable_partitioning = true
  max_size_in_megabytes = "1024"
  supports_ordering = true
},
{
   name = "thetopic"
  enable_partitioning = true
  max_size_in_megabytes = "1024"
  supports_ordering = true 
}]

service_Bus_Queues = [ {
  name = "joesques"
  enable_partitioning = false
},
{
  name = "thequeue"
  enable_partitioning = false
} ]

### SQL managed instances ###
instance_Config = {
  name = "sqlmijp2334"
  license_type       = "BasePrice"
  sku_name           = "GP_Gen5"
  storage_size_in_gb = 32
  subnet_name        = "subnetA"
  vcores             = 4
}