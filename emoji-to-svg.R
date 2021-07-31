# Scrape SoftBank 1997 emoji from Emojipedia and save as SVG
# Matt Dray, July 2021

# SoftBank 1997 hub page on Emojipedia:
#   https://emojipedia.org/softbank/1997/show_all/#more

# Emojipedia blog about SoftBank as the 'first' emoji set:
#   https://blog.emojipedia.org/correcting-the-record-on-the-first-emoji-set/


# Prepare workspace -------------------------------------------------------


# Need a one-time install.packages() if not installed already
library(polite)
library(rvest)
library(purrr)
library(magick)
library(svglite)
library(png)

source("R/utils.R")  # load bespoke functions


# Scrape ------------------------------------------------------------------


ep_bow <- bow(
  url = "https://emojipedia.org/softbank/1997",
  user_agent = "M Dray <https://www.matt-dray.com>"
)

sb_urls <- scrape(ep_bow) |> html_nodes("a") |> html_attr("href")

sb97_urls <- sb_urls[grepl("/1997/", sb_urls) & !grepl("more", sb_urls)]

sb97_img <- map_chr(sb97_urls, scrape_sb_gif)


# Download files ----------------------------------------------------------


walk2(
  sb97_img,
  basename(sb97_urls),
  ~{ cat("Downloading", .y, "\n")
    download.file(.x, file.path("img", "gif", paste0(.y, ".gif")))
    Sys.sleep(sample(1:5, 1)) }
)


# Convert gif to PNG ------------------------------------------------------


gif_paths <- list.files("img/gif", pattern = ".gif", full.names = TRUE)
png_paths <- gsub("gif", "png", gif_paths)

walk2(
  gif_paths,
  png_paths, 
  ~image_read(.x) |> image_write(.y, format = "png")
)


# Create outputs ----------------------------------------------------------


svg_paths <- gsub("png", "svg", png_paths)

walk2(
  png_paths, 
  svg_paths,
  ~save_emoji(pixelate_emoji(.x), file_out = .y)
)


# Demo plots --------------------------------------------------------------


# Grid of all 90 emoji (random rainbow colours)
png("plot/emoji-grid.png", width = 900, height = 1000)
par(mfrow = c(10, 9), mar = rep(1, 4))
walk(
  png_paths,
  ~pixelate_emoji(.x) |> plot_emoji(col_px = sample(rainbow(7), 1))
)
dev.off()

# Thumbs up, disappointed face, pile of poo (black and white)
png("plot/emoji-three.png", width = 600, height = 200)
par(mfrow = c(1, 3), mar = rep(1, 4))
walk(
  png_paths[c(82, 19, 55)],
  ~pixelate_emoji(.x) |> plot_emoji()
)
dev.off()
