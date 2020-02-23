# CD Proof of Concept

## Disclaimer

This repository contains unencrypted keys. Do not use this in production environments.  This is a proof of concept. Reimplement these ideas securely, if you find them useful.

## What this does

This is a proof of concept that will allow you to build gems and push them to a gem repository. It will only ever use the branch that you tell it to and the state of the repo that has been merged into your central repository. This will help ensure that built gems that have been deployed correspond to your designated branch for the environment in which this runs, instead of an Engineer's feature branch.

## Running This yourself

This repository uses three docker containers.

* Jenkins
* An agent with Ruby and the required environment to build gems
* Geminabox

To get started, run `docker-compose up`

You will require various credentials to proceed with the following. Most importantly:

* You need a deploy token (or other form of access) to this repo on github for Jenkins to Authenticate as. Please fork the repo and configure access on your fork.
* You will need to add credentials to Jenkins that authenticate it against the agent that you add below. Use `root` and the id_rsa key in the agent directory of this repository.

Once the containers are running, some configuration needs to happen in Jenkins:

* Install the suggested plugins
* Add this repository to Jenkins as a Multi-stage pipeline
* Add an agent to Jenkins called Ruby with the hostname `agent`

## TODO

I would like to add an example post-recieve hook to this repo that calls Jenkins to run a build on every merge into master. This would automate the entire build process from the point that an Engineer's changes are merged onwards.

## In production

* SSH Access would be securely configured (using puppet?).
* The Jenkinsfile would contain an extra step that runs a seperate integration test pipeline before building the gem.
* The Jenkinsfile would contain an extra step that runs a seperate deploy pipeline to get the built gems on the hosts that need it.

## Conclusion

With minimal changes, the steps above should allow a team to automate their CI/CD process from the merge step all the way to running the gem on the hosts that need it.
