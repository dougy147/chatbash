`chatbash` is a simple bash script to interact with ChatGPT API.

```bash
chatbash "Hello! Do you copy?"
> Yes, I copy. How can I help?

echo "Hello! Do you copy?" | chatbash
> Yes, I copy.

echo "Hello! Do you copy?" > file.txt
chatbash ./file.txt
> Yes, I do!
```
## Quick start

```bash
git clone https://github.com/dougy147/chatbash
cd ./chatbash
make install
chatbash
```
It will prompt you for your API key. You can also provide it in `$HOME/.config/chatbash/chatbash.conf`.

## Dependencies

- curl
- jq
- (optional) alsa-utils [audio output]
- (optional) espeak [audio output]
