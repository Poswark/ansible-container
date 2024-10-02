
docker build -t serverx-container .

docker run -d -p 2222:22  --name serverx-container serverx-container