for instance in worker-1 worker-2; do
  scp ca.pem ${instance}-key.pem ${instance}.pem ${instance}:~/
done

for instance in master-1 master-2 master-3; do
  scp ca.pem ca-key.pem kubernetes-key.pem kubernetes.pem \
    service-account-key.pem service-account.pem ${instance}:~/
done
