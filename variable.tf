variable "env" {
  type        = any
  description = "infrastructure environment"
}
 
variable "cidr" {
  type        = string
  description = "The IP range to use for the VPc"
  default     = "20.0.0.0/16"
}




variable "Role" {
  type = string
  
}

variable "public-sg" {
    type=map(object({
        port=number
       
        protocol=string
        cidr_blocks=list(string)
      
        
      
    }))


 default = {
   "publicport" = {
    
     port = 80
     protocol = "tcp"
     cidr_blocks=["0.0.0.0/0"]
     
   }
    "port443" = {
     
     port = 443
     protocol = "tcp"
    cidr_blocks=["0.0.0.0/0"]
     
   }
   "port22" = {
     
     port = 22
     protocol = "tcp"
     cidr_blocks=["0.0.0.0/0"]
     
   }
 }  
}

variable "private-sg" {
    type=map(object({
        port=number
       
        protocol=string
        cidr_blocks=list(string)
    }))


 default = {
   "publicport2" = {
    
     
     
     port = 3389
     protocol = "tcp"
     cidr_blocks=["0.0.0.0/0"]
     
  
    
   
   }
}
}



