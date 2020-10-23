# DRAFT

a `service` is an abstract way to expose an application running on a set of `pods` as a network service

Kubernetes gives Pods their own IP addresses and a single DNS name for a set of Pods, and can load-balance across them.

## manifest

```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: MyApp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 9376
```

- selector : list of pods matching the selector
- port: port of the service
- targetPort: port where the network will be routed to (to pods matching the selector)

## service types

- _ClusterIP_: (default) Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster.
- _NodePort_ : Exposes the Service on each Node's IP at a static port (the NodePort). A ClusterIP Service, to which the NodePort Service routes, is automatically created. You'll be able to contact the NodePort Service, from outside the cluster, by requesting <node_ip>:<node_port>
- _LoadBalancer_ : Exposes the Service externally using a cloud provider's load balancer. It automatically creates the NodePort and ClusterIP Services, to which the external load balancer routes.
- ExternalName : todo

- expose a deployment with a ClusterIP service 
- expose a deployment with a NodePort service (try to reach it from any node)

## service without selector

```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: MyApp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 9376

```

- expose google.com as a service

```
apiVersion: v1
kind: Endpoints
metadata:
  name: my-service
    subsets:
    - addresses:
        - ip: 192.0.2.42
          ports:
          - port: 9376
```
