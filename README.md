## Preface

(Work in progress)
This repo was created with the only intention to show how do I structure my projects. Within, you will see a system which interacts with a fully working monorepo, and some customizations across the entire projects. You may note that I use a lot of different technologies, as listed above:

- yarn
- Turborepo
- Next.js
- CircleCI
- Terraform
- Jest
- Playwright

Feel free to give me your feedback about this project, I'm always open to learn new things and improve my skills.

## Installation and usage

You should clone this repo first:

```bash
git clone https://github.com/falanges/devops-poc-1.git
```

## Development

Turborepo cli will assist you to run the different commands, for instance, if you want to run all the apps at same time you can use the following command:

```bash
turbo run dev
```

You can opt to run just one app:

```bash
turbo run dev --filter=web
```

## Building

You can build the entire project with the following command:

```bash
turbo run build
```

## Testing

You can run the tests with the following command:

```bash
turbo run test
```

There is a way to run tests in watch mode, in case you need to:

```bash
turbo run test:watch
```

Open [http://localhost:3000](http://localhost:3001) with your browser to see the result.
### Docker

This repo is configured to be built with Docker, and Docker compose. To build all apps in this repo:

```
# Create a network, which allows containers to communicate
# with each other, by using their container name as a hostname
docker network create app_network

# Build prod using new BuildKit engine
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose -f docker-compose.yml build

# Start prod in detached mode
docker-compose -f docker-compose.yml up -d

## To Do

- [ ] Add a better documentation
- [ ] Playwright tests
- [X] Terraform
- [ ] CircleCI improvements
- [ ] AWS deployment
- [ ] CD
- [ ] Git hooks
- [ ] ... All your suggestions are welcome!
