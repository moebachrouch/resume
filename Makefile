.PHONY: all

CC = xelatex
EXAMPLES_DIR = examples
SRC_DIR = src
RESUME_DIR = src/resume
CV_DIR = src/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
OUT_DIR = out

all: $(foreach x, coverletter cv public-resume resume, $x.pdf)

resume.pdf: $(SRC_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(SRC_DIR) $<

cv.pdf: $(SRC_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(SRC_DIR) $<

coverletter.pdf: $(SRC_DIR)/coverletter.tex
	$(CC) -output-directory=$(SRC_DIR) $<

init:
	rm -rf $(SRC_DIR)/*.aux
	rm -rf $(SRC_DIR)/*.log
	rm -rf $(SRC_DIR)/*.out
	rm -rf $(SRC_DIR)/*.synctex.gz

clean:
	rm -rf $(OUT_DIR)/*.pdf

move:
	cp $(SRC_DIR)/*.pdf $(OUT_DIR)/
