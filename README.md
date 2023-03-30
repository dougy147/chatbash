`chatbash` is nothing serious and unfinished. Just a simple script to interact with ChatGPT API. It has basic functions such as audio output, image generation or typewriting effect.

```bash
chatbash "Do as if you were describing a magnificent painting" | chatbash --image

chatbash "Output a script in bash that says 'Hello world'" | bash

chatbash "Tell me a joke about std::function in C" --audio=en --type-writer=on
```

## Quick start

```bash
git clone https://github.com/dougy147/chatbash
cd ./chatbash
make install
chatbash
```
It will prompt you for your API key. You can also provide it in `$HOME/.config/chatbash/chatbash.conf`.

History for images, prompts and answers is saved here : `$HOME/.config/chatbash/`. You can disable it with `--hist=off`.

## Dependencies

- curl
- jq
- (optional) alsa-utils [audio output]
- (optional) espeak [audio output]

### Not finished

Some options such as `--select-model` have no effect for the moment. Maybe someday.
