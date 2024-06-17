managementResourceGroup = {
  location = "Uk South"
  name = "manage"
}

networksResourceGroup = {
  location = "Uk South"
  name = "network"
}

apis = [{
    name = "api1test"
    revision = "1"
    display_name = "APItest1Example"
    path = "testy"
    protocols = ["https"]
}]

apim_Config = {
    name           = "apim-joe-test-12"
    publisher_name = "Joe Parr"
    publisher_email = "joe.parr@ans.co.uk"
    sku_name        = "Developer_1"
}

plan = {
  name =  "asp-jp-test-2043"
  sku_name = "B1"
  zone_balancing = false
}

appService = {
  name = "app-jp-23-thf"
  appSettings = {
    
  }
}

server = {
  name = "sql-serv-jp-23"
  version = "12.0"
}

database = {
  name = "db1"
  edition = "Standard"
  collation = "SQL_LATIN1_GENERAL_CP1_CI_AS"
}

storageAccount = {
  name = "sajptesty23"
  shareName = "sharing"
}