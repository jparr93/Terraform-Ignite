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
