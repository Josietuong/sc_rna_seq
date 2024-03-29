DOCKERHUB_USERNAME=josietuong
IMAGE_VERSION=amd64
IMAGE_NAME=scrnaseq
PLAT=linux/amd64
# build docker image
build:
        docker build --platform=${PLAT} -t $(DOCKERHUB_USERNAME)/$(IMAGE_NAME):$(IMAGE_VERSION) .

# run interactive docker image
run:
        docker run -it -v /Users/josietuong/scrnaseq:/home $(DOCKERHUB_USERNAME)/$(IMAGE_NAME):$(IMAGE_VERSION)

# push docker image to dockerhub
push:
        docker push $(DOCKERHUB_USERNAME)/$(IMAGE_NAME):$(IMAGE_VERSION)

sockeye_pull:
        module load apptainer; \
        apptainer pull --name scrnaseq.sif docker://$(DOCKERHUB_USERNAME)/$(IMAGE_NAME):$(IMAGE_VERSION)
