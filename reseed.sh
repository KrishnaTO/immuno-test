#!/bin/sh

sh seed-via-docker.sh --clean -C project.yaml
rm -rf target/immunotest/src/sparql
cp -r sparql target/immunotest/src/sparql

for id in chr cl ec go hgnc hgnc.genegroup mgi nbo ncbitaxon pato pr rgd uberon uniprot; do
    rm target/immunotest/src/ontology/imports/${id}_terms.txt
    cp imports/${id}_terms.txt target/immunotest/src/ontology/imports/${id}_terms.txt
done

cd target/immunotest/src/ontology
sh run.sh make all