A manifest is usually a yaml file (rarely json) representing the desired state of a resource

It's always structured with the 4 following parts

## apiVersion

each kubernetes resource has its own apiVersion (depending on the version of kubernetes)

## kind

the type of resource described in the manifest

## metadata

a way to describe (and retrieve) the resource

## spec

a description of the components of the resource

## practice

let's try to create a manifest file for the following resource : ( `vi ./my-first-resource.yml`) 
- the type of this resource is `Pod` (we'll see what it is it the next section)
- as defined in the `v1` API
- we'd like this resource to have the `name` `my-pod`
- it's composed of a `containers` array with a single element whose `name` is `my-container` and `image` is `nginx`

Every resource described in a manifest can be created using the `k apply -f <manifest_path>` so when you think it's fine, use it with your manifest file. 

_tip : yaml really doesn't like tabs, you can use `:set expandtab` then `:retab` in vim in order to convert every potential tab character to spaces._

Then run `k get po my-pod`. If everything went fine, you should eventually see a resource marked as `Running`

> Is it up and running ?


[pod](./pod.md)
