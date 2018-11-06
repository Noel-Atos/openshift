oc patch scc hostpath -p '{"allowHostDirVolumePlugin": true}'
oc patch scc hostpath -p '{"allowHostNetwork": true}'
oc patch scc hostpath -p '{"allowPrivilegedContainer": true}'

