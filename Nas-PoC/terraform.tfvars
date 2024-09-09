managementResourceGroup = {
  location = "Uk South"
  name = "sql"
}

networksResourceGroup = {
  location = "Uk South"
  name = "fabric"
}

sql_Server = {
  name = "sqlserver12jp"
  version = "12.0"
}

azure_sql_databases = [ {
  name = "db1"
  edition = "Standard"
  collation = "SQL_LATIN1_GENERAL_CP1_CI_AS"
},
{
  name = "db2"
  edition = "Standard"
  collation = "SQL_LATIN1_GENERAL_CP1_CI_AS"
}  ]

### SQL managed instances ###
instance_Config = {
  name = "sqlmijp2334"
  license_type       = "BasePrice"
  sku_name           = "GP_Gen5"
  storage_size_in_gb = 32
  subnet_name        = "subnetA"
  vcores             = 4
}


sql_mi_databases = [ {
  name = "db1"
},
{
  name = "db2"
}  ]

