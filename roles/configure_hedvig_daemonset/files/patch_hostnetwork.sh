oc patch scc hostnetwork -p '{"allowHostDirVolumePlugin": true}'
oc patch scc hostnetwork -p '{"allowHostNetwork": true}'
oc patch scc hostnetwork -p '{"allowPrivilegedContainer": true}'
