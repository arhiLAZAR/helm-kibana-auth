# Prerequisites Details
* Kubernetes 1.18+
* Installed and configured [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html) and [Kibana](https://www.elastic.co/guide/en/kibana/current/index.html)
* Installed and configured [Keycloak](https://www.keycloak.org/) or any different backend for OAuth2-Proxy
* Some LDAP installation
# Overview
This chart will do the following:

* Install [OAuth2-Proxy](https://github.com/oauth2-proxy/oauth2-proxy)
* Add two ingresses: for Kibana and for OAuth2-Proxy
* Add a CronJob for syncing users from LDAP to Elasticsearch using [arhiLAZAR/ldap-to-elastic](https://github.com/arhiLAZAR/ldap-to-elastic)

# Installation
To install the chart with the release name `my-release`:

```bash
git clone https://github.com/arhiLAZAR/helm-kibana-auth.git
cd helm-kibana-auth && cp values.yaml my-values.yaml
#<put your OAuth2-Proxy config into my-values.yaml>
helm install -f my-values.yaml my-release ./
```
