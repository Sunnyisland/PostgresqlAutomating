#!/bin/bash
#My first script

#ssh to dbsrv1
ssh dbsrv1.cdf.toronto.edu

#open database connection
psql csc343h-t6dothih

echo "Hello!"
