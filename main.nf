#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

params.input = "hello_input_wdl_example.wdl"

workflow {

    input_ch = Channel.fromPath(params.input)

    NUM_LINES(input_ch)

    NUM_LINES.out.view()
}

process NUM_LINES {

    input:
    path read

    output:
    path 'greeting_nf.txt'

    script:
    """
    printf '${read}'
    echo
    mycnt=\$(cat ${read} | wc -l)
    echo Number of lines: \$mycnt > greeting_nf.txt
    """
}
