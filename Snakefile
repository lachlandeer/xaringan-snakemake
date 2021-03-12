
# --- Variable Declarations ---- #
run_r   = "Rscript --no-save --no-restore --verbose"
log_all = "2>&1"

# --- Build Rules ---#
rule build_html:
    input:
        slides = "slides.Rmd",
        runner = "knit_xaringan.R"
    output:
        slides = "slides.html"
    log:
        "logs/slides.Rout"
    shell:
        "{run_r} {input.runner} {input.slides} \
                    {output.slides} > {log} {log_all}"

rule build_pdf:
    input:
        slides = "slides.html",
        runner = "run_decktape.R"
    output:
        slides = "slides.pdf"
    log:
        "logs/decktape.Rout"
    shell:
        "{run_r} {input.runner} {input.slides} \
                    {output.slides} > {log} {log_all}"

rule all:
    input:
        pdf  = "slides.pdf",
        html = "slides.html"

rule clean:
    shell: 
        "rm *.pdf *.html"

# --- renv rules --- #