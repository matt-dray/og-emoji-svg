# Function: scrape paths to emoji gifs
scrape_sb_gif <- function(sb_ext, bow = ep_bow) {
  cat("Scraping", basename(sb_ext), "\n")
  session <- nod(ep_bow, sb_ext)
  scrape(session) |> html_nodes("img") |> html_attr("src")
}

# Function: png to matrix
pixelate_emoji <- function(path_in) {
  x <- png::readPNG(path_in)
  y <- matrix(as.vector(x), 32)
  t(y[nrow(y):1, 33:64])
}

# Function: matrix to svg
save_emoji <- function(emo_mat, file_out, dimn = 10) {
  svglite::svglite(file_out, width = dimn, height = dimn)
  par(mar = rep(0, 4), mfrow = c(1, 1))
  plot_emoji(emo_mat)
  dev.off()
}

# Function: matrix to plot
plot_emoji <- function(emo_mat, col_px = "black", col_bg = "white") {
  image(
    emo_mat,
    col = c(col_bg, col_px),
    useRaster = TRUE,
    axes = FALSE, xaxs = NULL, yaxs = NULL
  )
}
