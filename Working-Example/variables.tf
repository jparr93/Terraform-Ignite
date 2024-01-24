variable "subnets"{
    type = map(any)
    default = {
      subnet1 = {
        name = "subnet1"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name = "subnet2"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
}

variable "resourceGroupPrefix" {
  type = string
  default = "rg"
}

variable "resourceGroupDefault"{
    type = object({
             name = string, 
             location = string
 })
}