# URL Shortener API

API created to make short URLs

## How to run?

```
docker run -d -p 4000:4000 joyvis/url-shortener-api:0.0.1.RELEASE
```

## How to use?

Send a post to `http://localhost:4000/links` with the following body:
```
{
    "link": {
        "url": "http://www.google.com"
    }
}
```

it will return a response like this:

```
{
    "shortened_url": "http://localhost:4000/a19754"
}
```

then you just have to open shortened_url link and it will redirect you to the url sent.
