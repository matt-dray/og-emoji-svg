
# og-emoji-svg

<!-- badges: start -->

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![rostrum.blog
post](https://img.shields.io/badge/rostrum.blog-post-008900?style=flat&labelColor=black&logo=data:image/gif;base64,R0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh+QQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2021/07/31/og-emoji-svg/)
<!-- badges: end -->

This repo contains R code to scrape ([politely](https://dmi3kno.github.io/polite/)) the gif images of [SoftBank’s 1997 emoji set](https://emojipedia.org/softbank/1997/) (considered to be [the first emoji](https://blog.emojipedia.org/correcting-the-record-on-the-first-emoji-set/)) from [Emojipedia](https://emojipedia.org/), then convert these to plottable images and write them to [SVG format](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics).

You can read more about the process and see some outputs in [the accompanying blog post](https://www.rostrum.blog/2021/07/31/og-emoji-svg/).

The main script is `/emoji-to-svg.R` and functions are sourced from `/R/utils.R`.

I have not included any outputs in this repo whatsoever. The intention of this repo is education. All resulting images are for personal use only. The designs belong to [SoftBank](https://www.softbank.jp/en/).
