#!/bin/sh

echo ":: Cloning BIO-QA Repos..."
echo

SH_REPOS_DIR="$HOME/repos/sh"
TB_REPOS_DIR="$HOME/repos/tb"

mkdir -p ${SH_REPOS_DIR}
cd ${SH_REPOS_DIR}

echo ":::: Cloning SH repos..."
echo
git clone https://github.com/stubhubint/Stubhub.citools.git
git clone https://github.com/stubhubint/Stubhub-CICD.lightning-docs.git
git clone https://github.com/stubhubint/Stubhub.topology.git
git clone https://github.com/stubhubint/Stubhub.relmgt-tools.git
git clone https://github.com/SHstubber/unified-catalog-tools.git
git clone https://github.com/stubhubint/BIO-QA.Postman-collections.git
git clone https://github.com/stubhubint/Stubhub.global-utility-service.git
git clone https://github.com/stubhubint/Stubhub.global-domain-utils.git
git clone https://github.com/stubhubint/Stubhub.qe-global-registry.git
git clone https://github.com/stubhubint/Stubhub.test-platform.git
git clone https://github.com/stubhubint/Stubhub.test-platform-utils.git
git clone https://github.com/stubhubint/Stubhub-CloudOps.terraform-google-corp.git
git clone https://github.com/stubhubint/Stubhub-CloudOps.terraform-google.git
git clone https://github.com/stubhubint/Stubhub-CloudOps.terraform-google-network.git
git clone https://github.com/stubhubint/Stubhub.global-test-context.git

echo

mkdir -p ${TB_REPOS_DIR}
cd ${TB_REPOS_DIR}

echo "::::  Cloning TB repos..."
echo
git clone git@github.com:ticketbis/qa-core-geb.git
git clone git@github.com:ticketbis/qa-sales-geb.git
git clone git@github.com:ticketbis/qa-mailing-geb.git
git clone git@github.com:ticketbis/qa-geb-skeleton.git
git clone git@github.com:ticketbis/qa-fronts-geb.git
git clone git@github.com:ticketbis/qa-dashboard.git
git clone git@github.com:ticketbis/qa-checkout-geb.git
git clone git@github.com:ticketbis/qa-backoffice-geb.git 

echo

