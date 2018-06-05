

#==================
#   Phương án 1
#==================


library(pdftools)
library(tesseract)
library(magick)

## ------------------
## Một số hàm hỗ trợ
## ------------------

get_pdfs <- function(path) {
  list.files(path, pattern = "\\.pdf$", full.names = TRUE)
}

pdf2png <- function(pdfs, format = "png", dpi = 400L, pages = 1:2) {
  lapply(pdfs, function(x) {
    pdftools::pdf_convert(pdf = x, dpi = dpi, pages = pages)
  })
}


## --------------------
## Convert về png
## --------------------


pdf_files <- get_pdfs(path = "C:/Users/HP/Desktop/RedBookPDF")
pdf2png(pdf_files)


## ----------------------
## Image pre-processing 
## ----------------------

png100_1 <- image_read("G-000100_1.png")
png100_2 <- image_read("G-000100_2.png")
png157_1 <- image_read("G-000157_1.png")
png157_2 <- image_read("G-000157_2.png")
png174_1 <- image_read("G-000174_1.png")
png174_2 <- image_read("G-000174_2.png")


png100_1 <- image_crop(png100_1, "3000x2500+60+2100")
png100_2 <- image_crop(png100_2, "3000x3000+60+70")
png2 <- image_rotate(png100_2, 1)

png157_1 <- image_crop(png157_1, "3000x2500+60+2100")
png157_2 <- image_crop(png157_2, "3000x3000+60+70")

png174_1 <- image_crop(png174_1, "3000x2500+60+2100")
png174_2 <- image_crop(png174_2, "3000x3000+60+70")

## ---------------------
## Khai thác phần text
#----------------------

# vie <- tesseract::tesseract("vie")
text100_1 <- ocr(png100_1)
text100_2 <- ocr(png100_2)
cat(text100_1)
cat(text100_2)

text157_1 <- ocr(png157_1)
text157_2 <- ocr(png157_2)
cat(text157_1)
cat(text157_2)

text174_1 <- ocr(png174_1)
text174_2 <- ocr(png174_2)
cat(text174_1)
cat(text174_2)

#=====================
#     Phương án 2
#=====================


path <- dir("C:\\Users\\HP\\Desktop\\RedBookPDF", full.names = TRUE)

pngfile <- pdftools::pdf_convert(path[1], dpi = 300)
text <- tesseract::ocr(pngfile)
text


library(stringr)
p2 <- text[2]
str_locate_all(p2, ":") %>% as.data.frame() ->> u



str_sub(p2, u$start[4], u$start[4] + 4)
str_sub(p2, u$start[5] - 3, u$start[5] + 3)
str_sub(p2, u$start[6], u$start[7] + 30)



#================================
#  Lập riêng bộ từ điển số 2
#================================

thua_dat_so <- "Thﬁ'a dél 35:"
manh_ban_do <- "him 66) SE):"
dia_chi <- "chi:"
dien_tich <- "Dién tich:"
hinh_thuc_su_dung <- "HiI]1’ltl'1ﬁ'C sﬁdung:"
thoi_han <- " sir dung:"


pos_thua_dat_so <- str_locate_all(p2, thua_dat_so) %>% 
  as.data.frame() %>% 
  pull(1)


pos_manh_ban_do <- str_locate_all(p2, manh_ban_do) %>% 
  as.data.frame() %>% 
  pull(1)















