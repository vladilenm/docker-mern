mongo:
	docker run -p 27017:27017 \
		-d \
 		--rm \
	 	--name mongodb \
	 	--network notes-net \
	 	--env-file ./config/development.env \
	 	-v mongo-data:/data/db \
	 	mongo

backend:
	docker run -p 5000:5000 \
		--rm \
		-d \
		--name notes-backend \
		--network notes-net \
		-v /Users/vladilen/WebstormProjects/docker-mern-practice/server:/app \
		-v /app/node_modules \
		--env-file ./config/development.env \
		notes-backend

frontend:
	docker run -p 3000:3000 \
		-d \
		--rm \
		--name notes-frontend \
		-v /Users/vladilen/WebstormProjects/docker-mern-practice/client/src:/app/src \
		notes-frontend

stop:
	docker stop mongodb notes-frontend notes-backend

dev:
	docker-compose -f docker-compose.yml up -d

build:
	docker-compose -f docker-compose.production.yml up -d

down:
	docker-compose down

# SSH

SSH_STRING:=root@31.184.254.152

ssh:
	ssh $(SSH_STRING)

copy-files:
	scp -r ./* $(SSH_STRING):/root/app