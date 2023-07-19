
import os
from kubernetes import client, config

STATUS = os.environ['POD_STATUS']

# Configs can be set in Configuration class directly or using helper utility
# config.load_kube_config()
config.load_incluster_config()

v1 = client.CoreV1Api()
print(f'Listing pods with POD_STATUS: {STATUS}')
ret = v1.list_pod_for_all_namespaces(watch=False)
for i in ret.items:
  if i.status.phase == STATUS:
    print("%s\t%s\t%s" % (i.status.phase, i.metadata.namespace, i.metadata.name))
