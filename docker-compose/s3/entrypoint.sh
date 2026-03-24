#!/bin/sh

minio server /data --console-address ":9001" &

until curl -s http://localhost:9000/minio/health/live; do
  echo "Waiting for MinIO to start..."
  sleep 1
done

mc alias set local http://localhost:9000 "${MINIO_ROOT_USER}" "${MINIO_ROOT_PASSWORD}"
mc mb --ignore-existing local/"${BUCKET_NAME}"
mc anonymous set download local/"${BUCKET_NAME}"

echo "Bucket ${BUCKET_NAME} set as PUBLIC"

wait
