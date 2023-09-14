<!-- PROJECT DESCRIPTION -->



# <a name="about-project"> FinansFlux </a>
<p align="center">
  <img src="https://github.com/romans-adi/finans-flux/assets/83185550/fd2316c2-39c9-4f44-a442-b27f7e3242a1" alt="logo-color" width="300" height="300" />
</p>
FinansFlux is your go-to app for effortless financial management. Track your expenses, create categories, and stay in control of your budget with ease, all in one streamlined platform. Say goodbye to financial stress and hello to financial clarity with FinansFlux.

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [Tech Stack](#tech-stack) 🛠️
- [Key Features](#key-features) ✨
- [Getting Started](#getting-started) 🚀
  - [Setup](#setup) 🔧
  - [Installation](#installation) ⚙️
  - [Usage](#usage) 🧰
  - [Tests](#tests) :heavy_check_mark:
  - [Troubleshooting](#troubleshooting) :nut_and_bolt:
- [Live Demo](#demo) :currency_exchange:
- [Video Presentation](#video) :tv:
- [Authors](#authors) 🖋️
- [Future Features](#future-features) 🌟
- [Contributing](#contributing) 🤝
- [Support](#support) 🆘
- [Acknowledgments](#acknowledgments) 🙏
- [License](#license) 📄

<!-- TECH STACK -->

## Tech Stack 🛠️ <a name="tech-stack"></a>

  <ul>
     <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
     <li><a href="https://rubyonrails.org/">Ruby On Rails</a></li>
     <li><a href="https://tailwindcss.com/">Tailwind</a></li>
     <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
     <li><a href="https://rspec.info/">RSpec</a></li>
     <li><a href="https://github.com/teamcapybara/capybara">Capybara</a></li>
     <li><a href="https://github.com/heartcombo/devise">Devise</a></li>
     <li><a href="https://github.com/CanCanCommunity/cancancan">CanCanCan</a></li>
  </ul>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FEATURES -->

## ✨ Key Features<a name="key-features"></a>

- [x] Five main models: User, Group, Category, Transaction and Entity, following the ERD diagram.
- [x] Associations between models, including one-to-many and many-to-one relationships.
- [x] Generated corresponding migration files for each model with appropriate attributes.
- [x] Added foreign keys and indexes to ensure data integrity and optimize database queries.
- [x] Utilized timestamps for tracking creation and update times automatically.
- [x] Followed naming conventions for models, tables, and columns as per Rails standards.
- [x] Generated migration files to create necessary tables, columns, and associations.
- [x] Data validations and tests for models to ensure data integrity.
- [x] Model methods to process data and tests to validate their functionality.
- [x] Integrated Devise gem for user authentication and registration.
- [x] Integrated CanCanCan gem for user authorization (CRUD control).
- [x] Implemented forms for user input and data submission.
- [x] CRUD actions in controllers for managing model instances.
- [x] View templates to render data and user interfaces.
- [x] Optimized queries to handle n+1 problem.
- [x] Tests to verify the behavior of controller actions and responses.
- [x] Integration tests to cover user interactions.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 🚀 Getting Started<a name="getting-started"></a>

### Setup 🔧<a name="setup"></a>

1. Ensure you have Ruby installed on your system. You can check your Ruby version in the terminal by running:

```
ruby -v
```

If Ruby is not installed, you can download and install it from the official Ruby website.

2. Ensure you have Ruby on Rails (RoR) installed on your system. You can check your Rails version in the terminal by running:

```
rails -v
```

If Rails is not installed, you can install it using the following command:

```
gem install rails
```

3. To get a local copy up and running, follow these steps.
Choose the directory on your local machine where you want to copy project. For example:

```
cd /home/user/name-of-your-directory
```

Clone the project using one of the options.

Using SSH-key:

```
git clone git@github.com:romans-adi/finans-flux.git
```
Using HTTPS:

```
git clone https://github.com/romans-adi/finans-flux.git
```

You can also create the new directory just adding the name of it in the end of command. For example:

```
git clone https://github.com/romans-adi/finans-flux.git finans-flux
```
### Installation ⚙️<a name="installation"></a>

To run this project locally, follow these steps:

1. Open your terminal or command prompt.

2. Navigate to the directory where you have cloned or downloaded the Ultimate Recipe Assistant repository.

3. Run the following command to install any required dependencies:
```bundle install```

### Usage 🧰<a name="usage"></a>

1. Once the setup is complete, ensure you are still in the directory containing the Ultimate Recipe Assistant files.

2. To set up the database and seed initial data, run the following commands:

```
rails db:create
rails db:migrate
```

This will create the database and apply migrations.

If you want to populate the database you can run (this step is not required):

```
rails db:seed
```

To see the populated data you must log in with these credentials:

> user@example.com
> password

3. To precompile assets for production deployment, execute the following command:

```
rails assets:precompile
```

Precompiling assets is essential for improved performance and loading times in a production environment.

4. To run the app in development mode, execute the following command:

```
rails server
```

5. The app will be accessible at `http://localhost:3000` in your web browser.

  If you encounter any issues with the email verification process, please refer to the Devise documentation or seek assistance from the Devise community.

7. If you have future features like GUI or interactive mode, follow the specific instructions provided for those features in the app's documentation.

### Troubleshooting :nut_and_bolt:<a name="troubleshooting"></a>

#### Rendering

If you encounter any issues related to missing assets or unexpected behavior after making changes, try the following steps:

1. Delete the `tmp` directory located in the root of your project:

```
rm -rf tmp/
```

This can help clear any cached data that might be causing issues.

2. Delete the `public/assets` directory:

```
rm -rf public/assets/
```
This ensures that any previously precompiled assets are removed, and new ones will be generated during the next precompilation.

#### Database

 If you encounter any problems related to data or database inconsistencies, you can follow these steps to reset your database:

1. Ensure Server/Process Shutdown: Make sure that your Rails server or any related processes are not running. You should not have any active connections to the database.

2. Drop the Database:

```
rake db:drop
```

or

```
rails db:drop
```

3. Recreate the Database [how to](#usage)

After dropping the database, you can recreate it from scratch. Run migrations to set up the schema.

If problems persist, you can refer to the official [Ruby on Rails Guides](https://guides.rubyonrails.org/getting_started.html) for more troubleshooting tips and guidance.

### Tests :heavy_check_mark:<a name="tests"></a>

To run the tests for the Finans Flux requests and models, ensure you are in the directory containing the test files.

1. Install RSpec:

Find your gemfile and add the RSpec gem in the development, test group:

```
group :development, :test do
  gem 'rspec-rails'
end
```

2. Then in your terminal run the command:

```
bundle install
```

3. To set up RSpec in your app and create the spec folder run:

```
rails generate rspec:install
```

4. Run the tests for all the models using the following command:

```
rspec spec/models
```

5. Alternatively, you could run tests for any specific suit using the following command (an example for Movement model):

```
rspec spec/models/movement.rb
```

6. All tests should pass without any errors or failures, ensuring that all models and their methods are functioning correctly.

<!-- LIVE DEMO -->

## :currency_exchange: Live Demo <a name="demo"></a>

Experience Finans Flux in action with our live demo.
Explore the features and functionality of our application firsthand at [Finans Flux Live Demo](https://finans-flux.onrender.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- VIDEO PRESENTATION -->

## :tv: Video Presentation <a name="video"></a>

For a quick overview of Finans Flux, watch [our video presentation](https://www.loom.com/share/ab897e224b894447b3f5e08983b2c217?sid=ea6359a9-c319-4366-bba9-960df8a5f02c) highlighting key features and benefits.
Get a glimpse of what our platform can do in just a few minutes.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 🖋️ Authors & Contributors<a name="authors"></a>

  🧑‍🦲 **Romans Š.**

- GitHub: [@romans-adi](https://github.com/romans-adi/)
- LinkedIn: [Romans Špiļaks](https://www.linkedin.com/in/obj513/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🌟 Future Features <a name="future-features"></a>

- [ ] User Confirmation Email: Implement a user confirmation email feature. When users sign up for your application, send them a confirmation email with a unique link. Users must click on the link to verify their email addresses and activate their accounts. This helps ensure that users provide valid email addresses and reduces the risk of fake or inactive accounts.

- [ ] Card Tracking: Add a card tracking feature that allows users to input and manage their credit and debit cards. Users can enter card details, such as card type, number, expiration date, and issuer. This feature can also include options for users to track their card balances, credit limits, and transaction history. Card tracking can help users keep an organized record of their payment methods within the application.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

I welcome contributions to enhance the functionality and user experience of the Ultimate Recipe Assistant Application. If you have any ideas, suggestions, or bug reports, feel free to open an issue or submit a pull request. Let's share ideas!

If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with descriptive commit messages.
4. Push your changes to your forked repository.
5. Submit a pull request to the main repository, explaining your changes in detail.

Please adhere to the coding conventions and guidelines specified in the project.

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## 🆘 Support <a name="support"></a>

If you encounter any issues or have any questions or suggestions, please open an issue on the [issue tracker](../../../issues/).
Furthermore, if you would like to get in touch with me, you can find our contact information in the <a href="#authors">Authors</a> section.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🌲 Acknowledgements <a name="acknowledgments"></a>

I would like to thank the following individuals and projects for their contributions and inspiration:

[Ruby official](https://www.ruby-lang.org/) :  Special thanks to Yukihiro Matsumoto, the creator of the Ruby programming language, for giving me this powerful and elegant tool to build amazing applications. I am also grateful to the Ruby Core Team and the passionate Ruby community for their continuous support and contributions.

[Ruby on Rails](https://rubyonrails.org/): A big thank you to the creators, contributors, and maintainers of the Ruby on Rails framework. Your efforts have empowered countless developers to build powerful and scalable web applications.

[Gregoire Vella](https://www.behance.net/gregoirevella): Special thanks to Gregoire Vella for sharing their exceptional modern and practical designs.

<!-- LICENSE -->

## 📄 License <a name="license"></a>

This project is [MIT](LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
