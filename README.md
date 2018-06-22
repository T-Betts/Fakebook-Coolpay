# Coolpay API Tech Test
## Scenario

Coolpay is a new company that allows to easily send money to friends through their API.

You work for Fakebook, a successful social network. You’ve been tasked to integrate Coolpay inside Fakebook. A/B tests show that users prefer to receive money than pokes!

You can find Coolpay documentation here: http://docs.coolpayapi.apiary.io/

You will write a small app that uses Coolplay API in Ruby. The app should be able do the following:

- Authenticate to Coolpay API
- Add recipients
- Send them money
- Check whether a payment was successful

## User Stories

```
As a User,
So that I can make payments on Fakebook using the Coolpay API,
I would like to be able to authenticate to Coolpay.
```

```
As a User,
So that Coolpay knows which people I am going to pay,
I would like to be able to create a recipient.
```

```
As a User,
So that I can send money to recipients,
I would like to be able to create a payment.
```

```
As a User,
So that I can check that whether a transaction went as intended,
I would like to be able to check whether a payment was successful.
```
## Domain Model
![Domain Model](Fakebook-CoolpayAPI-domain-model.jpg)
