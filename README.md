
 This shows how to create a scapped rhel9 bootc image, as well as
 creating an installation ISO to install to bare metal, or to a VM.
 
 There are also instructions for setting up a container repository from which 
 clients can pull updates across the network via https. The startup script
 is in registry-data.

--Build bootc image

To build the rhel9 SCAP'd bootc image, do this:

cd rhel9-bootc

./build-bootc-scapped.sh

When the build finishes, you can check it with "podman images."

You should see an image called "localhost/rhel9-bootc-scapped-v1.2."


--Setup Registry







--Build Installation ISO of bootc image

Now, to build an ISO from this image for installing on a system, do this:

cd ../ bootc-buildiso

Make sure the version of the image in the buildiso.sh script matches
the version of the image you see with "podman images."

./buildiso.sh

You may need to do "podman login registry.redhat.io" with your credentials.
