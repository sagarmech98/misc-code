+---------------------------+
|       terraform init      |
|    (reads backend config) |
+---------------------------+
            ↓
+---------------------------+
|  provider.tf configures   |
|     Azure credentials     |
+---------------------------+
            ↓
+---------------------------+
|  main.tf calls VM module  |
|  for each tool in var     |
+---------------------------+
            ↓
+---------------------------+
|   vm/main.tf provisions   |
|   public IP, NIC, NSG, VM |
+---------------------------+
            ↓
+---------------------------+
|   vm/variables.tf uses    |
|   inputs from main.tf     |
+---------------------------+

File	            What it does
main.tf	            Tells Terraform to create VMs using a module
variables.tf	    Defines input values (like VM size, name)
provider.tf	        Connects to Azure & stores Terraform state
vm/main.tf	        Actual code that creates VM, IP, NIC, DNS
vm/variables.tf	    Receives inputs from root main.tf



+------------------------+
| Root variables.tf      |  ← inputs like vm_size, rg_name, tools
+------------------------+
            ↓
+------------------------+
| Root main.tf           |  ← loops over tools, calls module
+------------------------+
            ↓
+------------------------+
| Module vm/             |
| - variables.tf         |  ← gets inputs
| - main.tf              |  ← uses inputs to create Azure resources
+------------------------+
            ↓
+------------------------+
| Azure Resources        |  ← VM, NIC, IP, DNS, NSG created
+------------------------+



                        ┌────────────────────────┐
                        │      variables.tf      │
                        │  (tools, rg_name, etc) │
                        └──────────┬─────────────┘
                                   │
                      passes input variables
                                   │
                        ┌──────────▼────────────┐
                        │       main.tf         │
                        │ Calls vm module in a  │
                        │ loop for each "tool"  │
                        └──────────┬────────────┘
                                   │
                        ┌──────────▼────────────┐
                        │      vm module        │
                        │   (./vm/main.tf)      │
                        │   (./vm/variables.tf) │
                        └──────────┬────────────┘
                                   │
                      uses inputs to create Azure resources
                                   │
    ┌──────────────────────────────┼────────────────────────────────────┐
    │                              │                                    │
┌───▼────┐                  ┌──────▼──────┐                     ┌───────▼───────┐
│ Public │                  │  Network    │                     │ Virtual       │
│  IP    │◄────────────────►│ Interface   │◄──────────────────►│ Machine (VM)  │
└────────┘                  │(with NSG)   │                     └───────────────┘
                            └──────┬──────┘
                                   │
                          ┌────────▼────────┐
                          │ DNS Records     │
                          │ (A & private)   │
                          └─────────────────┘
