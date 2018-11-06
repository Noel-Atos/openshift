oc patch scc privileged -p '{"allowHostDirVolumePlugin": true}'
oc patch scc privileged -p '{"allowHostNetwork": true}'
oc patch scc privileged -p '{"allowPrivilegedContainer": true}'
