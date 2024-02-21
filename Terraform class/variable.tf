# I will like to create a variable block in order to declear my variable
variable "location" {
  type        = string
  description = "Creating variable for location"
  #default     = "west europe"
}


# Create a variable for address space

variable "address_space" {
  type        = list(string)
  description = "create  an adress space"
  #default     = ["10.0.0.0/16"]
}
# create a variable for address prefixs
variable "address_prefixes" {
  type        = list(string)
  description = " create address prefixes"
  #default     = ["10.0.2.0/24"]
}