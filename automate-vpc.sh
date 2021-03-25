#!/bin/bash

# Automate the creation of VPC, firewall and subnet
# Run the following commands as a root uuser

choose_account() {
gcloud config configurations activate $1
}

vpc() {

echo "Hold on a minute.. . Creating your VPC"
gcloud compute networks create $2 --description "Automate VPC" --subnet-mode custom
}

firewall() {

echo "Creating Firewall"
gcloud compute firewall-rules create $2-fw-allow-ssh --network $2 --allow tcp:22
}
                                                                                                                        
subnet() {

echo "Creating subnet"
gcloud compute networks subnets create $2-subnet1-europe-west-2 --network $2 --region europe-west2 --range 10.10.1.0/24
# Display just created subnet
gcloud compute networks subnets list --network $2
}

completed() {
echo "Successful! One VPC, one firewall and one subnet created"
exit
}


# Error handling

if [  -n "$1"  ] ||  [ -n "$2" ]; then
echo  "Error: Missing argument(s)"

fi

    vpc
    firewall
    subnet
    completed
