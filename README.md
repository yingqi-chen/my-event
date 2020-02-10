# My Event 

As a bridge between organizations and volunteers, you can comment on volunteers that have helped you on some certain events and thus give other organizations some ideas about them before they want to use them. 


## Installation

Put this to your terminal:

```ruby
git clone git@github.com:chanwkkk/my-event.git
```

And then go inside the folder by typing this in your terminal:

```
cd my-event
```

And then install all missing gems by input:
```
bundle install
```

And then you can run the program by running:

```
rails s
```
After that, you should be able to see the following sentences:

```
=> Booting Puma
=> Rails 6.0.0 application starting in development
=> Run `rails server --help` for more startup options
Puma starting in single mode...
* Version 3.12.1 (ruby 2.6.1-p33), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:3000
Use Ctrl-C to stop
```
That means the website is working now. You can visit the website by going to 
`http://localhost:3000/`. Then you are free to explore the website!

## Usage

On the home page, you can set up your own user account or log in(you can also log in with your google account!) if you already have one. Also, you can go directly to user index page and event index page. 
When you go to user index page, you can check out user's file and then see which one is the volunteer you want to comment on or look at the comment so as to approach them later for your event(but only an organization is authorized to comment on an volunteer.)
When you go to event index page, you can check out the events or if you are an organization,you can make your own event so that people can see it from the website. 
