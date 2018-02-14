gcloud compute instances create instance-from-gcloud-cli \
  --boot-disk-size=10GB \
  --image=ubuntu-1604-xenial-v20170815a \
  --image-project=ubuntu-os-cloud \
  --machine-type=f1-micro \
  --labels=role=willberemovedin24h \
  --preemptible \
  --restart-on-failure \
  --zone=europe-west1-d
