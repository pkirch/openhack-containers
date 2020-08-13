#!/bin/bash
set -eu

az aks create -g rg-ch3-aks-02 \
    -n ch3aks04 \
    --enable-aad \
    --vm-set-type VirtualMachineScaleSets \
    --generate-ssh-keys \
    --location northeurope \
    --network-plugin azure \
    --network-policy azure \
    --vnet-subnet-id /subscriptions/99bf560c-de07-4e30-a290-79e1b6987e8a/resourceGroups/teamResources/providers/Microsoft.Network/virtualNetworks/vnet/subnets/vm-subnet \
    --aad-admin-group-object-ids 6b744665-14d0-4fd3-bfbf-06af024ab4dc \
    --service-principal 6ec5ad6a-4d52-4fce-a9cb-efcfd8af7dfb \
    --client-secret UBwqksZhEZ8kktK-2Ym7LJ_bh5MsSJWmGS 
    #--load-balancer-sku standard

    #--service-principal 6ec5ad6a-4d52-4fce-a9cb-efcfd8af7dfb \