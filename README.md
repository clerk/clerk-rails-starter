# Rails starter repo with Clerk

To start a new Rails app with Clerk, follow these steps:

- Fork this repo
- Clone your fork locally with `git clone`
- `cd` into your freshly cloned git repo
- `cp .env.sample .env.local`
- Find your instance configuration in the [Clerk
  dashboard](https://dashboard.clerk.dev/) and edit your .env.local accordingly
- Run `bundle install` (you need to have [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [bundler](https://bundler.io/) installed)
- Run `yarn install` (you need to have [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) and
  [yarn 1](https://classic.yarnpkg.com/en/docs/install) installed)
- Run the server with `rails s`
